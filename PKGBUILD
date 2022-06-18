# Maintainer: yjun <jerrysteve1101 at gmail dot com>

_pkgname=STM8
_gitname=ghidra_${_pkgname}
pkgname=ghidra-extension-$(echo $_pkgname | tr '[:upper:]' '[:lower:]')-git
pkgver=r29.1b7a596
pkgrel=1
pkgdesc="Plugin for Ghidra to assist reversing STM8 processor."
arch=('x86_64')
url=https://github.com/esaulenka/${_gitname}
license=('MIT')
depends=('ghidra')
makedepends=('git' 'ghidra')
source=("git+https://github.com/esaulenka/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/${_gitname}
  # Sleigh Compile
  /opt/ghidra/support/sleigh -a data/languages 
  # Fix read permission for other
  chmod o+r  data/languages/*.sla
}

package() {
  cd $srcdir/${_gitname}
  ghidra_dir=$(dirname $(readlink -fe $(which ghidra)))

  install -d $pkgdir/${ghidra_dir}/Ghidra/Extensions

  # Copy Files into destination folder
  cp -a $srcdir/${_gitname} $pkgdir/${ghidra_dir}/Ghidra/Extensions

  install -Dm 644 $srcdir/${_gitname}/LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}

# vim: set sw=2 ts=2 et:
