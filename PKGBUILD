# Maintainer: Bailey Fox <bfox200012@gmail.com>

pkgname=uefitool-ng-git
_pkgname=uefitool-ng
_tools=('UEFITool' 'UEFIExtract' 'UEFIFind')
pkgver=r367.2cbd78f
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('any')
url='https://github.com/LongSoft/UEFITool'
branch='new_engine'
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}#branch=${branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./unixbuild.sh --configure
  for tool in "${_tools[@]}"; do
    cd "$tool"
    make
    cd ..
  done
}

package() {
  cd "$srcdir/$_pkgname"
  # Tools
  for tool in "${_tools[@]}"; do
    install -D -m755 "$tool/$tool" "$pkgdir/usr/bin/${tool,,}-ng"
  done
  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
