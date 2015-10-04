# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=irccloud-electron-git
_pkgname=IRCCloud
pkgver=42.13d2e17
pkgrel=1
pkgdesc="Mac App, Win App and Linux app for IRCCloud. (An Electron wrapper for IRCCloud.) "
arch=('any')
url="https://github.com/dalinaum/${_pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm' 'git' 'wget')
source=("${_pkgname}"::"git+https://github.com/dalinaum/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"
	wget "https://aur.archlinux.org/cgit/aur.git/plain/irccloud-electron.desktop?h=irccloud-electron-git" -o ./irccloud-electron.desktop
}

build() {
  cd "${srcdir}/${_pkgname}"
	echo "Building.. : [Install Build Dependencies] | Build | Done"
  npm install
  rm -rf dist
  mkdir dist
	echo "Building.. : Install Build Dependencies | [Build] | Done"
  ./build-linux.js ${_pkgname} $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	echo "Building.. : Install Build Dependencies | Build | [Done]"
}

package() {
  cd "${srcdir}"
	echo "Packaging.. : [Desktop Shortcut] | Icon | Other Files | Done"
	install -Dm644 "${srcdir}/irccloud-electron.desktop" "$pkgdir/usr/share/applications/irccloud-electron.desktop"
	echo "Packaging.. : Desktop Shortcut | [Icon] | Other Files | Done"
	install -Dm644 "${srcdir}/${_pkgname}/resources/icon.iconset/icon_512x512.png" "$pkgdir/usr/share/irccloud-electron/icon.png"
	echo "Packaging.. : Desktop Shortcut | Icon | [Other Files] | Done"
	cp -r ${srcdir}/${_pkgname}/build/IRCCloud-linux/* $pkgdir/usr/share/irccloud-electron/
	echo "Packaging.. : Desktop Shortcut | Icon | Other Files | [Done]"
}
