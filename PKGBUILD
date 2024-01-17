# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.7.5
pkgrel=1
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
	'setup-py_extensions_relative_paths.patch'
  '6b8766080d2c331a05abbddbf3c7332dbb9df791.patch')
md5sums=('ad0e7a15dc263cc40ac522e3acbe002b'
         '506f83849dd3afab00501fc2442473fb'
         'aafcfe22e3d825f980df67fe06734c61')

build() {
  cd "$srcdir"/pytorch3d-$pkgver

  # Fix build with CUDA 12.3
  patch -p1 < "${srcdir}/6b8766080d2c331a05abbddbf3c7332dbb9df791.patch"

  # Avoid references to $srcdir in SOURCES.txt and native Python extension
  patch -p1 < "${srcdir}/setup-py_extensions_relative_paths.patch"
  CFLAGS+=" -ffile-prefix-map=$PWD/="
  CXXFLAGS+=" -ffile-prefix-map=$PWD/="
  NVCC_FLAGS+="-Xcompiler -ffile-prefix-map=$PWD/="
  export NVCC_FLAGS

  python setup.py build
}

package() {
  cd "$srcdir"/pytorch3d-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
}
