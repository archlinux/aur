# Maintainer: acxz <akashpatel2008 at yahoo sdot com>
# Contributor:  rubenvb <vanboxem.ruben@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clfft
pkgver=2.12.2
pkgrel=2
pkgdesc="A software library containing FFT functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=('ocl-icd')
makedepends=('opencl-headers' 'cmake')
checkdepends=('fftw' 'gtest')

source=("${pkgname}-${pkgver}::https://github.com/clMathLibraries/clFFT/archive/v${pkgver}.tar.gz"
        "cpp11.patch::https://github.com/clMathLibraries/clFFT/commit/05a21f45d20e9532cdf811f152ebef60fa99b258.patch")

sha256sums=('e7348c146ad48c6a3e6997b7702202ad3ee3b5df99edf7ef00bbacc21e897b12'
            '1a33f840c4b1c87afa17a8e444c2cf8ade9eefbd4b06d7e101bdf9f9043c555f')

if [ "$CARCH" == "x86_64" ]; then
_bits=64
elif [ "$CARCH" == "i686" ]; then
_bits=32
fi

prepare() {
    cd "${srcdir}/clFFT-${pkgver}"
    patch --strip=1 < "${srcdir}/cpp11.patch"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ../clFFT-${pkgver}/src \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install

  rm -rf "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/lib/libStatTimer.so"
}
