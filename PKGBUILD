# Maintainer: Lev Velykoivanenko <velykoivanenko dot lev at gmail dot com>
# Contributor: Adam Gradzki <adam at mm dot st> (previous maintainer)
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile
# Contributor: p00h <p00hzone at gmail dot com>
# Contributor: Michał Walenciak <Kicer86 at gmail dot com>

pkgname=('python-dlib-cuda' 'python2-dlib-cuda')
_pkgname='dlib'
pkgver=19.16
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64')
url="http://www.dlib.net/"
license=('Boost')
depends=('cuda' 'cudnn' 'libx11')
makedepends=('cmake' 'cuda' 'cudnn' 'libx11' 'python' 'python2')
optdepends=('cblas: for BLAS support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
source=("http://dlib.net/files/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('37308406c2b1459a70f21ec2fd7bdc922277659534c708323cb28d6e8e4764a8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  _compiler_opts=()
  # Detecting whether certain cpu optimisations can be made
  if grep -q avx /proc/cpuinfo; then
    _compiler_opts+=( '--yes' 'USE_AVX_INSTRUCTIONS' )
  fi

  if grep -q sse2 /proc/cpuinfo; then
    _compiler_opts+=( '--yes' 'USE_SSE2_INSTRUCTIONS' )
  fi

  if grep -q sse4 /proc/cpuinfo; then
    _compiler_opts+=( '--yes' 'USE_SSE4_INSTRUCTIONS' )
  fi

  # Checking if neon is installed
  if [[ -f '/usr/lib/libneon.so' ]]; then
    _compiler_opts+=( '--yes' 'USE_NEON_INSTRUCTIONS' )
  fi

  # Preparing array of variables setting the compiler for CUDA and optionally
  # ccache support.
  # Code based on the dlib package found in the AUR.
  # To enable ccache support you need to install the following package:
  # https://github.com/pingplug/PKGBUILDs/tree/master/others/ccache-ext
  _compiler_vars=( '--set' 'CUDA_HOST_COMPILER=/opt/cuda/bin/gcc' )
  if [[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]]; then
    _compiler_vars+=( '--set' 'CUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache' )
    _compiler_vars+=( '--set' 'CUDA_HOST_COMPILER=/usr/lib/ccache/bin/gcc-7' )
  fi

  # Compiling for Python 3
  python setup.py build "${_compiler_opts[@]}" "${_compiler_vars[@]}"

  # Compiling for Python 2
  python2 setup.py build "${_compiler_opts[@]}" "${_compiler_vars[@]}"
}

package_python-dlib-cuda() {
  depends=('python' 'cuda' 'cudnn' 'libx11')
  provides=("python-dlib=$pkgver")
  conflicts=('python-dlib')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-dlib-cuda() {
  depends=('python2' 'cuda' 'cudnn' 'libx11')
  provides=("python2-dlib=$pkgver")
  conflicts=('python2-dlib')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}

