# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Ben Curtis <nospam@nowsci.com>

pkgname=gnome-shell-extension-wintile-git
pkgver=r94.53e69a4
pkgrel=2
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://github.com/fmstrat/wintile"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
_srcname=wintile
sha256sums=('SKIP')

pkgver() {
	cd "$_srcname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_srcname"
	./build.sh
}

package() {
	cd "$_srcname"
	cd "$(dirname $(find -name 'metadata.json' -print -quit))"
	_extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	_destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
	bsdtar -xvf $_extname.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_extname"
}