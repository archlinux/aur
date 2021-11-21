# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=mozjpeg-git
pkgver=4.0.3.r198.g5552483d
pkgrel=1
pkgdesc='Improved JPEG encoder'
url='https://github.com/mozilla/mozjpeg'
arch=('x86_64')
license=('BSD')
depends=('glibc' 'libpng')
makedepends=('git' 'cmake' 'nasm' 'java-environment>11')
optdepends=('java-runtime>11: for TurboJPEG Java wrapper')
provides=('libjpeg' 'libjpeg.so' 'libturbojpeg.so' 'libjpeg-turbo' 'mozjpeg')
conflicts=('libjpeg' 'mozjpeg' 'libjpeg-turbo')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd mozjpeg
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd mozjpeg
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
	      -DCMAKE_BUILD_TYPE=None \
	      -DWITH_JAVA=ON \
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
	
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"
	# header required by some dependants
	# https://bugs.archlinux.org/task/24787
	install -m 644 jpegint.h "${pkgdir}/usr/include"
}
