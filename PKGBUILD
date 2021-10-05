# Maintainer: MGislv <nocentinigabriele91@gmail.com>

# Directly based off of extra/lib32-libjpeg-turbo

_name=mozjpeg
pkgname=lib32-mozjpeg-git
pkgver=4.0.3.r197.g512a7c3a
pkgrel=2
pkgdesc="Improved JPEG encoder (32-bit)"
url="https://github.com/mozilla/mozjpeg"
arch=('x86_64')
license=('BSD')
depends=('lib32-glibc' "${_name}-git")
makedepends=('git' 'cmake' 'nasm' 'lib32-gcc-libs' 'lib32-libpng')
provides=('lib32-libjpeg' 'libjpeg.so' 'libturbojpeg.so' 'lib32-libjpeg-turbo' 'lib32-mozjpeg')
conflicts=('lib32-libjpeg' 'lib32-mozjpeg' 'lib32-libjpeg-turbo')
source=(git+https://github.com/mozilla/mozjpeg.git)
sha512sums=('SKIP')

pkgver() {
	cd mozjpeg
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_name}"

	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
	      -DCMAKE_BUILD_TYPE='None' \
	      -DWITH_JPEG8=ON \
	      -DENABLE_SHARED=1 \
	      -DENABLE_STATIC=0 \
	      -W no-dev \
	      -B build \
	      -S .
	make -C build
}

package() {
	cd "${_name}"
	make DESTDIR="${pkgdir}" \
	     docdir="/usr/share/doc/${_name}" \
	     exampledir="/usr/share/doc/${_name}" \
	     install -C build
	
	# remove everything that is provided by libjpeg-turbo
	rm -rf "${pkgdir}"/usr/{include,share,bin}
	# license
	install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
