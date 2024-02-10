# Maintainer: hendy643 <hendy643@hotmail.com>

_pkgname=ghidra-amiga
pkgname=ghidra-extension-$(echo $_pkgname | tr '[:upper:]' '[:lower:]')-git
pkgver=r87.ga678c61
pkgrel=1
pkgdesc="Ghidra utilities for analyzing Commodore Amiga programs"
arch=('x86_64')
url=https://github.com/BartmanAbyss/${_pkgname}
license=()
provides=('ghidra-amiga')
conflicts=('ghidra-amiga')
depends=('ghidra')
makedepends=('git' 'gradle' 'unzip' 'ghidra' 'java-environment>=11')
optdepends=()
source=("$pkgname::git+https://github.com/BartmanAbyss/$_pkgname")
sha512sums=('SKIP')

prepare() {
  cp -rlfT $srcdir/$pkgname $srcdir/${_pkgname}
}

pkgver() {
  cd $srcdir/${_pkgname}
  count_commits=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short HEAD)
  echo "r${count_commits}.g${commit}"
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
  unzip -u dist/*.zip -d $pkgdir/${ghidra_dir}/Ghidra/Extensions/
}
