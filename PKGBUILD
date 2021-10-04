# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=canokey-usbip-git
pkgver=r899.ba5e1bf
pkgrel=1
pkgdesc="A virtual canokey based on USB/IP"
arch=('x86_64')
url="https://www.canokeys.org"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=('git+https://github.com/canokeys/canokey-core.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/canokey-core"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/canokey-core"
	git submodule update --init --recursive

	# # mbedtls version patch
	# cd canokey-crypto/mbedtls
	# git checkout v2.27.0
}

build() {
	cd "$srcdir/canokey-core"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSBIP=ON \
		-Wno-dev
	make -C build
}

package() {
	cd "$srcdir/canokey-core/build"
	make DESTDIR="$pkgdir/" install
	install -Dm755 "$srcdir/canokey-core/build/canokey-usbip" -t "$pkgdir/usr/bin/"
}
