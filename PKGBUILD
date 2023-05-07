# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.7.3
pkgrel=3
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
	'setup-py_extensions_relative_paths.patch'
	'b921efae3e52dcd93e553db3d02378951e894769.patch')
md5sums=('42eacb71e2c1b69cab7749851a619982'
         '17c874f9f01e9a3ab87544eb3435a779'
         'fe2ed98fa9469301bfb7931c4863bd8b')

build() {
  cd "$srcdir"/pytorch3d-$pkgver

  # Fix build with CUDA 12.1.1
  patch -p1 < "${srcdir}/b921efae3e52dcd93e553db3d02378951e894769.patch"

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
