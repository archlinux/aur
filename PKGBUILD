# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=candycrisis
pkgver=3.0.0
pkgrel=1
pkgdesc='An exciting combination of pure action and puzzle gaming!'
arch=('x86_64')
url='https://github.com/jorio/CandyCrisis'
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('git' 'cmake')
_commit='ae730c8d493b92bcc630806267532f063bad35f4'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'candycrisis.sh'
  'candycrisis.desktop'
)
b2sums=('SKIP'
        'ac4a7de030218677da4daade536267e1346d2de9451c448c929179acfd4893cfa95b10abddc0cea5dabfaf24983a560744304b554b5795a9118664b4bd77bc26'
        '71ea5321357b32402aabb1bef074d90e275d4b640c6f90d1363da126aac99b013602daea289430f5e5be9a90343bef6ac46ebf1155a430eacb7a872856f544ed')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  cmake \
    -S . \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

package() {
  cd "$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/candycrisis.sh" "$pkgdir/usr/bin/$pkgname"

  # move binary & assets
  install -vDm755 -t "$pkgdir/usr/lib/$pkgname" build/CandyCrisis
  mv CandyCrisisResources "$pkgdir/usr/lib/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/candycrisis-desktopicon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
    sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/README"
  install -vDm644 -t "$pkgdir/usr/share/doc/$packaging" packaging/screenshot.jpg
}
