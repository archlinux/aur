# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Bader <Bad3r@pm.me>
# Contributor: @pychuang (logseq-desktop-git)

# avoid cluttering user home, while allowing data to be cached
export HOME="$SRCDEST/node-home"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HoME/.local/share"

# basic info
_pkgname="logseq-desktop"
pkgname="$_pkgname"
pkgver=0.10.9
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=('x86_64')

depends=(
  dbus
  expat
  glib2
  nspr
  nss
)
makedepends=(
  clojure
  git
  nodejs
  npm
  python-setuptools
  yarn
)

install="$pkgname.install"

_pkgsrc="logseq-${pkgver}"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver}.$_pkgext"
)
sha256sums=(
  '9fe98bbeb4355c1ad3ea5b3776f02455ee86b8157f74dd53bb9b3367df31403a'
)

prepare() {
  cd "$_pkgsrc"

  # download required js modules
  yarn install

  # create and sync files to folder `static`
  yarn gulp:build

  # go to folder `static` and download required js modules in static
  cd "static"
  yarn install

  # go back to the top-level folder and download clojure dependencies
  cd "${srcdir}/$_pkgsrc"
  clojure -P -M:cljs
}

build() {
  cd "$_pkgsrc"

  # build
  yarn cljs:release

  # packaging javescript files to an executable
  cd "static"
  yarn electron-forge package
}

package() {
  # copy files
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp --reflink=auto -a -r -u "$_pkgsrc/static/out/Logseq-linux-x64"/* "$pkgdir/opt/$_pkgname"

  # executable
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/logseq" << 'EOF'
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

  # copy xdg desktop files
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Logseq
Comment=Privacy-first, open-source platform for knowledge sharing and management
Exec=logseq %u
Icon=logseq
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=x-scheme-handler/logseq;
StartupWMClass=Logseq
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
