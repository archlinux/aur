# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=vvdec-git
pkgver=r1.df4be18
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	mkdir -p "$pkgdir/usr/share/licenses/vvdec"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	cd "${srcdir}/vvdec"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/vvdec/"
	install -Dm755 "install/bin/release-shared/vvdecapp" "$pkgdir/usr/bin/"
	install -Dm755 "install/lib/release-shared/libvvdec.so" "$pkgdir/usr/lib/"
	cp -r "install/include" "$pkgdir/usr/"
	cp -r "install/lib/cmake" "$pkgdir/usr/lib/"
}
