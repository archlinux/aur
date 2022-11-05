# Maintainer: Luke Street <luke@street.dev>

_pkgname=Ghidra-GameCube-Loader
pkgname=ghidra-extension-gamecube-loader-git
pkgver=1.1.5.r0.gaf629bd
pkgrel=1
pkgdesc="A Nintendo GameCube binary loader for Ghidra"
arch=('any')
url=https://github.com/Cuyler36/${_pkgname}
license=('Apache 2.0')
provides=()
conflicts=()
depends=('ghidra')
makedepends=('git' 'unzip' 'gradle')
optdepends=()
source=("$_pkgname::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/${_pkgname}
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${_pkgname}
  rm -rf dist

  # Compile sleigh
  /opt/ghidra/support/sleigh -a data/languages
  chmod 0644 data/languages/*.sla

  gradle -PGHIDRA_INSTALL_DIR=/opt/ghidra
}

package() {
  cd $srcdir/${_pkgname}
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  # Extract built archive into destination folder
  unzip -u dist/*.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
