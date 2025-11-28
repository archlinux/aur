# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.7.9
pkgrel=1
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
  'setup-py_extensions_relative_paths.patch'
  'glog_use_glog_export.patch')
md5sums=('1868605ad28945ffcab4f39c3537c547'
         '91631716dae72cd1b8c004148ef39e76'
         '5aba33291116b36d04fe038b0b26274f')

build() {
  cd "$srcdir"/pytorch3d-$pkgver

  # Define GLOG_USE_GLOG_EXPORT when building C extension
  patch -p1 < "${srcdir}/glog_use_glog_export.patch"

  # Avoid references to $srcdir in SOURCES.txt and native Python extension
  patch -p1 < "${srcdir}/setup-py_extensions_relative_paths.patch"
  CFLAGS+=" -ffile-prefix-map=$PWD/="
  CXXFLAGS+=" -ffile-prefix-map=$PWD/="
  NVCC_FLAGS+="-Xcompiler -ffile-prefix-map=$PWD/= -static-global-template-stub=false"
  export NVCC_FLAGS

  python setup.py build
}

package() {
  cd "$srcdir"/pytorch3d-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
}
