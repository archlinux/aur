# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=canokey-usbip-git
pkgver=r1066.a88eaa87
pkgrel=1
pkgdesc="A virtual canokey based on USB/IP"
arch=('x86_64')
url="https://www.canokeys.org"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git')
optdepends=('usbip: usbip support')
source=('git+https://github.com/canokeys/canokey-core.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/canokey-core"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/canokey-core"
	git submodule update --init --recursive
}

build() {
	cmake -B build -S "canokey-core" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSBIP=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# DESTDIR="${pkgdir}" cmake --install build
	install -Dm755 "$srcdir/canokey-core/build/canokey-usbip" -t "$pkgdir/usr/bin/"
}
