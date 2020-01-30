# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=Ghidra-Cpp-Class-Analyzer
pkgname=ghidra-extension-$(echo $_pkgname | tr '[:upper:]' '[:lower:]')-git
pkgver=1.3.r28.ga87bf8a
pkgrel=1
pkgdesc="Ghidra C++ Class and Run Time Type Information Analyzer"
arch=('x86_64')
url=https://github.com/astrelsky/${_pkgname}
license=('MIT')
provides=()
conflicts=()
depends=('ghidra')
makedepends=('git' 'gradle' 'unzip' 'ghidra')
optdepends=()
source=("$pkgname::git+https://github.com/astrelsky/${_pkgname}")
sha512sums=('SKIP')

prepare() {
  cp -rlfT $srcdir/$pkgname $srcdir/${_pkgname}
}

pkgver() {
  cd $srcdir/${_pkgname}
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}