# Maintainer: Cortex
# Forked from Vesktop

## options
#: ${_electron_version:=29}
: ${_install_path:=usr/share}

# basic info
_pkgname="sunroof"
pkgname="$_pkgname-git"
pkgdesc="Forked Custom Discord desktop app with Suncord preinstalled"
pkgver=1.6.1
pkgrel=1
url="https://github.com/verticalsync/Sunroof"
license=('GPL-3.0-only')
arch=("any")

depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  "$_pkgname"
  "sunroof"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -e '/linux/s&^&"electronDist": "/usr/lib/electron'"${_electron_version:-}"'",\n&' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"
  pnpm i
  pnpm package:dir
}

package() {
  install -d "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc/dist/linux-unpacked/resources/app.asar" "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "$_pkgsrc/static/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec electron${_electron_version:-} /$_install_path/$_pkgname/app.asar "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Sunroof
GenericName=Internet Messenger
Comment=$pkgdesc
Type=Application
Exec=$_pkgname
Icon=$_pkgname
Categories=Network;InstantMessaging;
StartupWMClass=sunroof;
Keywords=discord;suncord;sunroof
END
}
