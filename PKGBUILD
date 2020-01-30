# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=ghidra-firmware-utils
pkgname=ghidra-extension-$(echo $_pkgname | tr '[:upper:]' '[:lower:]')-git
pkgver=0.1
pkgrel=1
pkgdesc="Ghidra utilities for analyzing PC firmware"
arch=('x86_64')
url=https://github.com/al3xtjames/${_pkgname}
license=('Apache')
provides=()
conflicts=()
depends=('ghidra')
makedepends=('git' 'gradle' 'unzip' 'ghidra')
optdepends=()
source=("$pkgname::git+https://github.com/al3xtjames/${_pkgname}")
sha512sums=('SKIP')

prepare() {
  cp -rlfT $srcdir/$pkgname $srcdir/${_pkgname}
}

pkgver() {
  cd $srcdir/${_pkgname}
  echo $(git describe --tags 2>/dev/null || echo '0.1') | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd $srcdir/${_pkgname}
  rm -rf dist
  GHIDRA_INSTALL_DIR=$(dirname $(readlink -fe $(which ghidra))) gradle
}

package() {
  ghidra_dir=$(dirname $(readlink -fe $(which ghidra)))
  cd $srcdir/${_pkgname}
  
  install -d $pkgdir/${ghidra_dir}/Ghidra/Extensions

  # Extract built archive into destination folder
  unzip -u dist/*.zip -d $pkgdir/${ghidra_dir}/Ghidra/Extensions/

  install -Dm 644 LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}