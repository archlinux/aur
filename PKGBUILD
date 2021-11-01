# Maintainer: Specter119 <specter119 [AT] gmail [DOT] com>

pkgname=python-mamba-org
_name=mamba
pkgver=0.17.0
pkgrel=1
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
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('c5f4add077f41ca9ff905d95003cf793c59e9d6959f19a139325dc66c904733a')

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
