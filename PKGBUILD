# Maintainer: MGislv <nocentinigabriele91@gmail.com>

pkgname=lib32-mozjpeg-git
pkgver=4.0.3.r198.g5552483d
pkgrel=3
pkgdesc='Improved JPEG encoder (32-bit)'
url='https://github.com/mozilla/mozjpeg'
arch=('x86_64')
license=('BSD')
depends=('lib32-glibc' 'mozjpeg-git')
makedepends=('git' 'cmake' 'nasm' 'lib32-gcc-libs' 'lib32-libpng')
provides=('lib32-libjpeg' 'libjpeg.so' 'libturbojpeg.so' 'lib32-libjpeg-turbo' 'lib32-mozjpeg')
conflicts=('lib32-libjpeg' 'lib32-mozjpeg' 'lib32-libjpeg-turbo')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd mozjpeg
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd mozjpeg

	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
	      -DCMAKE_BUILD_TYPE=None \
	      -DWITH_JPEG8=ON \
	      -DENABLE_SHARED=1 \
	      -DENABLE_STATIC=0 \
	      -W no-dev \
	      -B build \
	      -S .
	make -C build
}

package() {
	cd mozjpeg
	make DESTDIR="${pkgdir}" \
	     docdir='/usr/share/doc/mozjpeg' \
	     exampledir='/usr/share/doc/mozjpeg' \
	     install -C build
	
	# remove everything that is provided by libjpeg-turbo
	rm -rf "${pkgdir}"/usr/{include,share,bin}
	# license
	install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
