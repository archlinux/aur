# Maintainer: Lev Velykoivanenko <velykoivanenko dot lev at gmail dot com>
# Contributor: Adam Gradzki <adam at mm dot st> (previous maintainer)
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile
# Contributor: p00h <p00hzone at gmail dot com>
# Contributor: Michał Walenciak <Kicer86 at gmail dot com>

pkgname=('python-dlib-cuda')
_pkgname='dlib'
pkgver=19.19
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64')
url="http://www.dlib.net/"
license=('Boost')
depends=('cuda' 'cudnn' 'libx11')
makedepends=('cmake' 'cuda' 'cudnn' 'libx11' 'python')
optdepends=('cblas: for BLAS support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support'
            'ccache-ext: for ccache support during compiling'
            'python-numpy: for running numpy based tests')
source=("http://dlib.net/files/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('1decfe883635ce51acd72869cebe870ab9b85eb094d417adc8f48aa7b8c60cd7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  _compiler_opts=()
  # Detecting whether certain cpu optimisations can be made
  # Note: from dlib version 19.17 the default is to enable all options, so this
  # is a check if they need to be turned off
  if ! grep -q avx /proc/cpuinfo; then
    _compiler_opts+=( '--no' 'USE_AVX_INSTRUCTIONS' )
  fi

  if ! grep -q sse2 /proc/cpuinfo; then
    _compiler_opts+=( '--no' 'USE_SSE2_INSTRUCTIONS' )
  fi

  if ! grep -q sse4 /proc/cpuinfo; then
    _compiler_opts+=( '--no' 'USE_SSE4_INSTRUCTIONS' )
  fi

  # Checking if neon is installed
  if [[ ! -f '/usr/lib/libneon.so' ]]; then
    _compiler_opts+=( '--no' 'USE_NEON_INSTRUCTIONS' )
  fi

  # Preparing array of variables setting the compiler for CUDA and optionally
  # ccache support.
  # Code based on the dlib package found in the AUR.
  _compiler_vars=()
  if [[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]]; then
    _compiler_vars+=( '--set' 'CUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache' )
    _compiler_vars+=( '--set' 'CUDA_HOST_COMPILER=/usr/lib/ccache/bin/gcc' )
  else
    _compiler_vars+=( '--set' 'CUDA_HOST_COMPILER=/opt/cuda/bin/gcc' )
  fi

  # Compiling for Python 3
  python setup.py build "${_compiler_opts[@]}" "${_compiler_vars[@]}"
}


check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# The PYTHONPATH is cleared to avoid custom user paths getting in the way
	# of importing the right versions of packages
  PYTHONPATH="" python setup.py test
}

package_python-dlib-cuda() {
  depends=('python' 'cuda' 'cudnn' 'libx11')
  provides=("python-dlib=$pkgver")
  conflicts=('python-dlib')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}

