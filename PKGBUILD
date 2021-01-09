# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Rungel <dvzrv@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

_name=libjpeg-turbo
pkgname=lib32-${_name}-minimal-git
pkgver=2.0.6
pkgrel=1
pkgdesc='JPEG image codec with accelerated baseline compression and decompression'
arch=('x86_64')
url="https://libjpeg-turbo.org/"
license=('BSD')
depends=('lib32-glibc' "${_name}")
makedepends=('nasm' 'cmake')
provides=('lib32-libjpeg-turbo' 'lib32-libjpeg' 'libjpeg.so' 'libturbojpeg.so')
conflicts=(lib32-libjpeg-turbo)
source=("git+https://github.com/libjpeg-turbo/libjpeg-turbo.git")
sha512sums=('SKIP')
#validpgpkeys=('0338C8D8D9FDA62CF9C421BD7EC2DBB6F4DBF434') # The libjpeg-turbo Project (Signing key for official binaries) <information@libjpeg-turbo.org>

build() {
  cd "${_name}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_JPEG7=OFF \
	-DWITH_JPEG8=OFF \
	-DWITH_JAVA=OFF \
	-DWITH_TURBOJPEG=ON \
        ./
  make VERBOSE=1 -C build
}

#check() {
#  cd "${_name}"
#  make test -C build
#}

package() {
  cd "${_name}"

  make VERBOSE=1 DESTDIR="${pkgdir}" \
       docdir="/usr/share/doc/${_name}" \
       exampledir="/usr/share/doc/${_name}" \
       install -C build
  # remove everything that is provided by libjpeg-turbo
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  # license
  install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
