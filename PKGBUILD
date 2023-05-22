# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=mightymike
pkgver=3.0.2
pkgrel=2
pkgdesc='High Powered Action Rescue in a Toy Store Gone Mad'
arch=('x86_64')
url='https://github.com/jorio/mightymike'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
_commit='5337fc269afafec0c1571437f33f556fc0a4b264'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        '6cd424b2dc3628731e42ae22917cd51e2eb47178bb79ee5c77ae07f3cde10f9404b53c5bf4c2f444aac0ecb3363e5141fc9fd206307a1a2bf819315c5900dec8'
        'f5a0b6aaf304db6e04e8487c84677f8dc1dc877ce384ef24faece43484c4872f2422f3c4dd016b3ec804d47d1635e6b289bc4f9d6d32a98e65063ef275792e34')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.extern/Pomme.url "$srcdir/github.com-jorio-Pomme"
  git -c protocol.file.allow=always submodule update

  # ftbfs: gcc 13 & cstdint headers
  cd extern/Pomme
  git cherry-pick --no-commit d57c28e205462e51063e787f9ebddaadff592f1e
}

build() {
  cd "$pkgname"

  cmake \
    -S . \
    -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev

  cmake --build build
}

package() {
  cd "$pkgname"

  # move binary & assets
  install -vd "$pkgdir/usr/lib/$pkgname"
  mv -v build/{Data,MightyMike} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/MightyMike512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  rm -vf "$pkgdir/usr/share/doc/$pkgname/LICENSE.md"
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
