# Maintainer: Lev Velykoivanenko <velykoivanenko dot lev at gmail dot com>
# Contributor: Adam Gradzki <adam at mm dot st> (previous maintainer)
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile

pkgname=('python-dlib-cuda' 'python2-dlib-cuda')
_pkgname='dlib'
pkgver=19.9
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('cmake' 'boost' 'cuda' 'gcc6' 'python' 'python2')
optdepends=('cblas: for BLAS support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=('http://dlib.net/files/dlib-19.9.tar.bz2')
md5sums=('4a3868a1e88721b68ccfb0567eaac87b')

# Detecting whether certain cpu optimisations can be made
avx_available=()
if grep -q avx /proc/cpuinfo; then
  avx_available=( '--yes' 'USE_AVX_INSTRUCTIONS' )
fi

sse2_available=()
if grep -q sse2 /proc/cpuinfo; then
  sse2_available=( '--yes' 'USE_SSE2_INSTRUCTIONS' )
fi

sse4_available=()
if grep -q sse4 /proc/cpuinfo; then
  sse4_available=( '--yes' 'USE_SSE4_INSTRUCTIONS' )
fi

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Exporting compiler environment variables
  # This is necessary to get cuda support
  export CC=`which gcc-6` 
  export CXX=`which g++-6`
  
  # Compiling for Python 3
  python setup.py build -j $(nproc) "${avx_available[@]}" "${sse2_available[@]}" "${sse4_available[@]}"
  
  # Compiling for Python 2
  python2 setup.py build "${avx_available[@]}" "${sse2_available[@]}" "${sse4_available[@]}"
}

package_python-dlib-cuda() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-dlib-cuda() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

