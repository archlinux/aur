# Maintainer:  rubenvb <vanboxem.ruben@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clfft
pkgver=2.12.2
pkgrel=1
pkgdesc="A software library containing FFT functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=('ocl-icd')
makedepends=('opencl-headers' 'cmake')
checkdepends=('fftw' 'gtest')

source=("https://github.com/clMathLibraries/clFFT/archive/v${pkgver}.tar.gz")

sha512sums=('19e9a4e06f76ae7c7808d1188677d5553c43598886a75328b7801ab2ca68e35206839a58fe2f958a44a6f7c83284dc9461cd0e21c37d1042bf82e24aad066be8')

if [ "$CARCH" == "x86_64" ]; then
_bits=64
elif [ "$CARCH" == "i686" ]; then
_bits=32
fi

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "../clFFT-${pkgver}/src" #-DBUILD_TEST=true 
  make
}

check() {
  cd "${srcdir}/build"
  #./staging/Test
}

package() {
  cd "${srcdir}/build"
  make install DESTDIR=${pkgdir}
  rm -rf "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/lib/libStatTimer.so"
}
