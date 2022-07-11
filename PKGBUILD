# Maintainer: Luke Street <luke@street.dev>

_pkgname=Ghidra-Switch-Loader
pkgname=ghidra-extension-switch-loader-git
pkgver=1.5.0.r2.g5afeb1d
pkgrel=1
pkgdesc="A Nintendo Switch binary loader for Ghidra"
arch=('any')
url=https://github.com/Adubbz/${_pkgname}
license=('Apache 2.0')
provides=()
conflicts=()
depends=('ghidra')
makedepends=('git' 'unzip')
optdepends=()
source=("$_pkgname::git+${url}#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/${_pkgname}
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${_pkgname}
  rm -rf dist
  chmod +x gradlew
  ./gradlew -PGHIDRA_INSTALL_DIR=/opt/ghidra
}

package() {
  cd $srcdir/${_pkgname}
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  # Extract built archive into destination folder
  unzip -u dist/*.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
