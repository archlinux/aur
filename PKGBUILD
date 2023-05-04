# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.7.3
pkgrel=2
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz"
	'setup-py_extensions_relative_paths.patch'
	'8ea4da293846e64bee5cc99c8cb008888479947f.patch')
md5sums=('42eacb71e2c1b69cab7749851a619982'
         '17c874f9f01e9a3ab87544eb3435a779'
         '5da1d8f8903ea5a3c9f275d5152339c6')

build() {
  cd "$srcdir"/pytorch3d-$pkgver

  # Build fails with CUDA 12.1.1, revert invalid usage of cub::BlockReduce
  # See: https://github.com/facebookresearch/pytorch3d/issues/1529
  patch -p1 -R < "${srcdir}/8ea4da293846e64bee5cc99c8cb008888479947f.patch"

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
