# Maintainer: Adam Gradzki <adam at mm dot st>
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile

pkgname=('python-dlib-cuda' 'python2-dlib-cuda')
pkgver=19.7
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('cmake' 'boost' 'cuda' 'gcc-6' 'python' 'python2')
optdepends=('cblas: for BLAS support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=('http://dlib.net/files/dlib-19.7.tar.bz2')
md5=('119c17eda1075f6cfb3f8cd21f11f53b')

avx_available=''
if grep -q avx /proc/cpuinfo; then
  avx_available='--yes USE_AVX_INSTRUCTIONS'
fi

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
   python setup.py build $avx_available
  CUDNN_INCLUDE_DIR="/opt/cuda/include" CUDNN_LIBRARY_DIR="/opt/cuda/lib64" CC=`which gcc-6` CXX=`which g++-6`  python2 setup.py build $avx_available
}

package_python-dlib-cuda(){
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  CUDNN_INCLUDE_DIR="/opt/cuda/include" CUDNN_LIBRARY_DIR="/opt/cuda/lib64" CC=`which gcc-6` CXX=`which g++-6`  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-dlib-cuda(){
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  CUDNN_INCLUDE_DIR="/opt/cuda/include" CUDNN_LIBRARY_DIR="/opt/cuda/lib64" CC=`which gcc-6` CXX=`which g++-6`  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
