# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=vvdec-git
pkgver=0.2.0.1.r0.gefa0db6
pkgrel=1
pkgdesc="Fraunhofer Versatile Video Decoder (VVdeC)"
arch=('x86_64')
url='https://github.com/fraunhoferhhi/vvdec'
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'cmake>=3.12' 'gcc>=7')
provides=('vvdec')
conflicts=('vvdec')
source=("git+https://github.com/fraunhoferhhi/vvdec.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/vvdec"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export CFLAGS+=" ${CPPFLAGS}"
	export CXXFLAGS+=" ${CPPFLAGS}"
	cmake -B build -S "${srcdir}/vvdec" \
		-DCMAKE_BUILD_TYPE=Release \
		-DVVDEC_ENABLE_BITSTREAM_DOWNLOAD:BOOL=ON \
		-DVVDEC_ENABLE_INSTALL:BOOL=ON \
		-DBUILD_SHARED_LIBS:BOOL=ON \
		-Wno-dev
	make -C build
}

check() {
	make -C build test
}

package() {
	make -C build install
	cd "${srcdir}/vvdec"
	cp -r "install" "$pkgdir/usr"
	mkdir -p "$pkgdir/usr/share/licenses/vvdec"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/vvdec/"
}
