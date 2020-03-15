# Maintainer: Rajnish Mishra <contact.rajnishmishra@gmail.com>

pkgname=teleport-share-git
_pkgname=teleport
pkgver=0.0.1.r231.3610dff
pkgrel=1
pkgdesc="Send files on the local network"
arch=('x86_64')
url="https://github.com/frac-tion/teleport"
license=('AGPL')
depends=('libsoup' 'avahi' 'gtk3')
makedepends=('git' 'meson')
source=("git+https://github.com/frac-tion/teleport")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    v=$(grep -R -A3 '^project(' meson.build | grep 'version:' | cut -d\' -f2)
    printf "$v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	sed '/MESONTEST/s/^/#/' -i configure
}

build() {
	cd "${_pkgname}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${_pkgname}"
	make check
}

package() {
	cd "${_pkgname}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
