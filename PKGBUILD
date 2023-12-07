# Maintainer:
# Contributor: QiE2035 <qie2035@qq.com>

# options
: ${_system_electron:=true}
: ${_pkgtype:=non-opt}

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
  'asar'
  'gendesk'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="Logseq-linux-x64"
source=(
  "$url/releases/download/$pkgver/$_pkgsrc-$pkgver.zip"
)
sha256sums=(
  'b67a2dff464610f2a64952eda858eaa7a4351edb6cd4076f63804d7f5b6b7423'
)

prepare() {
  _gen_script

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
  if [[ "${_system_electron::1}" == 't' ]] ; then
    depends=('electron')

    # asar
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    asar pack "$_pkgsrc/resources/app" "${pkgdir:?}/usr/lib/$_pkgname/app.asar"
  else
    # package files
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"
  fi

  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  install -Dm644 "$_pkgsrc/resources/app/icons/logseq.png" \
    -t "$pkgdir/usr/share/pixmaps/"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/logseq"
}

_gen_script() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e
EOF

  if [[ "${_system_electron::1}" == 't' ]] ; then
    cat <<'EOF' >> "$_pkgname.sh"
_ELECTRON=/usr/bin/electron

APPDIR="/usr/lib/logseq-desktop"
_ASAR="${APPDIR}/app.asar"
EOF
  else
    cat <<'EOF' >> "$_pkgname.sh"
APPDIR="/opt/logseq-desktop"
_ELECTRON="${APPDIR}/Logseq"
EOF
  fi

  cat <<'EOF' >> "$_pkgname.sh"
_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/logseq-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox $_USER_FLAGS "$@"
fi
EOF
}
