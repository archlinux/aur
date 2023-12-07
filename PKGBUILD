# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

# options
: ${_pkgtype:=bin}

# basic info
_pkgname=logseq-desktop
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=0.10.1
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL3')
arch=("x86_64")

makedepends=(
  'gendesk'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="Logseq-linux-x64"
source=(
  "$url/releases/download/$pkgver/$_pkgsrc-$pkgver.zip"
)
sha256sums=('b67a2dff464610f2a64952eda858eaa7a4351edb6cd4076f63804d7f5b6b7423')

prepare() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/opt/logseq-desktop"
_ELECTRON="${APPDIR}/Logseq"

_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/logseq-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} --no-sandbox $_USER_FLAGS "$@"
fi
EOF

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="Logseq"
    --exec="logseq %u"
    --icon="logseq"
    --terminal=false
    --categories="Office"
    --mimetypes="x-scheme-handler/logseq"
    --startupnotify=true
    --custom="StartupWMClass=Logseq"
  )

  gendesk "${_gendesk_options[@]}"
}


package() {
  # copy files
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/logseq-desktop.desktop"

  # icons
  install -Dm644 "$_pkgsrc/resources/app/icons/logseq.png" \
    -t "$pkgdir/usr/share/pixmaps/"

  # script
  install -Dm755 "logseq-desktop.sh" "$pkgdir/usr/bin/logseq"
}
