# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=canokey-usbip-git
_pkgname=${pkgname%-git}
pkgver=r2.e9db44f
pkgrel=2
pkgdesc="A virtual canokey based on USB/IP"
arch=('x86_64')
url="https://www.canokeys.org"
license=('Apache-2.0')
depends=('usbip')
makedepends=('cmake' 'git')
source=('git+https://github.com/canokeys/canokey-usbip.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cmake -B build -S ${_pkgname} \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm755 "${srcdir}/build/${_pkgname}" -t "$pkgdir/usr/bin/"
}
