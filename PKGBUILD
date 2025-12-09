# Maintainer: Duje Mihanović <duje@dujemihanovic.xyz>

pkgname=uefitool-ng-git
_pkgname=uefitool-ng
pkgver=r718.906a80d
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor and utilities (new engine)'
arch=('x86_64' 'i686')
url='https://github.com/LongSoft/UEFITool'
license=('BSD-2-Clause')
depends=('qt6-base' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}#branch=new_engine")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -B build
  make -C build
}

package() {
  cd "$srcdir/$_pkgname"
  cmake --install build --prefix "$pkgdir/usr"

  # Coexistence with old engine
  mv "$pkgdir/usr/bin/uefitool" "$pkgdir/usr/bin/uefitool-ng"
  mv "$pkgdir/usr/share/applications/uefitool.desktop" "$pkgdir/usr/share/applications/uefitool-ng.desktop"
  sed -i 's/UEFITool/UEFITool NE/g' "$pkgdir/usr/share/applications/uefitool-ng.desktop"
  sed -i 's/uefitool/uefitool-ng/g' "$pkgdir/usr/share/applications/uefitool-ng.desktop"

  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
