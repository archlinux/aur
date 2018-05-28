# Maintainer: Lev Velykoivanenko <velykoivanenko dot lev at gmail dot com>
# Contributor: Adam Gradzki <adam at mm dot st> (previous maintainer)
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile
# Contributor: p00h <p00hzone at gmail dot com>

pkgname=('python-dlib-cuda' 'python2-dlib-cuda')
_pkgname='dlib'
pkgver=19.13
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64')
url="http://www.dlib.net/"
license=('Boost')
depends=('cuda' 'cudnn' 'libx11')
makedepends=('cmake' 'cuda' 'cudnn' 'gcc6' 'libx11' 'python' 'python2')
optdepends=('cblas: for BLAS support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
source=("http://dlib.net/files/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('69d806dea72789f1c0f43843f4007776')

# Detecting whether certain cpu optimisations can be made
_avx_available=()
if grep -q avx /proc/cpuinfo; then
  _avx_available=( '--yes' 'USE_AVX_INSTRUCTIONS' )
fi

_sse2_available=()
if grep -q sse2 /proc/cpuinfo; then
  _sse2_available=( '--yes' 'USE_SSE2_INSTRUCTIONS' )
fi

_sse4_available=()
if grep -q sse4 /proc/cpuinfo; then
  _sse4_available=( '--yes' 'USE_SSE4_INSTRUCTIONS' )
fi

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Exporting compiler environment variables
  # This is necessary to get cuda support
  export CC=$(command -v gcc-6)
  export CXX=$(command -v g++-6)

  # Compiling for Python 3
  python setup.py build "${_avx_available[@]}" "${_sse2_available[@]}" "${_sse4_available[@]}"

  # Compiling for Python 2
  python2 setup.py build "${_avx_available[@]}" "${_sse2_available[@]}" "${_sse4_available[@]}"
}

package_python-dlib-cuda() {
  depends=('python' 'cuda' 'cudnn' 'libx11')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-dlib-cuda() {
  depends=('python2' 'cuda' 'cudnn' 'libx11')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}

