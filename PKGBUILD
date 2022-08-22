# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.7.0
pkgrel=1
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
	'setup-py_extensions_relative_paths.patch')
md5sums=('a96cccd0bd168d0f4587e938d7e41872'
         '17c874f9f01e9a3ab87544eb3435a779')

build() {
  cd "$srcdir"/pytorch3d-$pkgver

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
