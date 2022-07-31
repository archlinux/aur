# Maintainer:  rubenvb <vanboxem.ruben@gmail.com>

pkgname=clfft-git
pkgver=2.12.2.r29.gc59712e
pkgrel=1
pkgdesc="A software library containing FFT functions written in OpenCL (git)"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=('ocl-icd')
makedepends=('opencl-headers' 'cmake' 'git')
conflicts=(clfft)

source=("git+https://github.com/clMathLibraries/clFFT.git")
md5sums=(SKIP)

if [ "$CARCH" == "x86_64" ]; then
_bits=64
elif [ "$CARCH" == "i686" ]; then
_bits=32
fi

pkgver() {
  cd "clFFT"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "../clFFT/src"
  make
}

check() {
  cd "${srcdir}/build"
#  ./staging/Test
}

package() {
  cd "${srcdir}/build"
  make install DESTDIR=${pkgdir}
  rm -rf "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/lib/libStatTimer.so"
}
