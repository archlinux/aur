# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=lib32-mozjpeg
pkgver=4.1.1
pkgrel=1
pkgdesc='JPEG image codec with accelerated baseline decoding and superior encoding (32-bit)'
url=https://github.com/mozilla/mozjpeg
license=(BSD)
arch=(x86_64)
depends=(lib32-glibc lib32-libpng "${pkgname#lib32-}")
makedepends=(nasm cmake git)
provides=(lib32-libjpeg libjpeg.so=8-32 libturbojpeg.so=0-32 lib32-libjpeg-turbo)
conflicts=(lib32-libjpeg lib32-libjpeg-turbo)
source=(git+"${url}".git#tag=v"${pkgver}")
md5sums=('SKIP')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cmake -B build -S ${pkgname#lib32-} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
		-DENABLE_STATIC=FALSE \
		-DPNG_SUPPORTED=TRUE \
		-DWITH_JPEG8=TRUE \
		-Wno-dev
	make -C build
}

#check() {
#	make -C build test
#}

package() {
	make -C build \
		DESTDIR="${pkgdir}" \
		docdir="/usr/share/doc/${pkgname}" \
		exampledir="/usr/share/doc/${pkgname}" \
		install

	# remove everything that is provided by mozjpeg
	rm -rf "${pkgdir}"/usr/{include,share,bin}

	install -Dm644 ${pkgname#lib32-}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
