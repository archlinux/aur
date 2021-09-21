# Maintainer: Specter119 <specter119 [AT] gmail [DOT] com>

pkgname=python-mamba-org
_name=mamba
pkgver=0.15.3
pkgrel=2
pkgdesc='The Fast Cross-Platform Package Manager'
arch=(any)
url=https://github.com/mamba-org/mamba
license=(BSD)
depends=(python reproc python-conda)
makedepends=(
  'python-setuptools>=49.2.1'
  'pybind11>=2.2'
  libarchive
  openssl
  curl
  yaml-cpp
  libsolv-conda-forge
  cpp-ghc-filesystem
  nlohmann-json)
checkdepends=(pytest gtest gmock)
conflicts=(python-mamba)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/0.15.3.tar.gz)
sha256sums=('f2ad92625954cd029b84725bc33f658020a589cefda0b18adb1b7825ab7d4a1f')

prepare() {
  cd $srcdir/$_name-$pkgver
  sed -i 's/\(.*MAMBA_CONDA_EXE_BACKUP=\).*$/\1\/usr\/bin\/conda/g' mamba/shell_templates/mamba.sh
  sed -i 's/\(.*MAMBA_EXE=\).*$/\1\/usr\/bin\/mamba/g' mamba/shell_templates/mamba.sh
}   

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  mv $pkgdir/usr/etc $pkgdir/etc
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
