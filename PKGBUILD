# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.6.2
pkgrel=1
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
	'setup-py_extensions_relative_paths.patch')
md5sums=('13b575d7c4a5bffc292eafa45b1f5b98'
         '227efe04799f45fbe0ce78d35f8d4625')

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
