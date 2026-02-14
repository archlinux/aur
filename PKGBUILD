# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=billy-frontier
pkgver=1.1.0
pkgrel=2
pkgdesc='An arcade action game with a "cowboys in space" theme'
arch=(x86_64 aarch64)
url='https://github.com/jorio/BillyFrontier'
license=(CC-BY-NC-SA-4.0)
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('d8b7a380b9e36d2ac136e14f68b73930e13e205a462ca39e2516eca3b11fead6d4f8bd6b933a261e8b83407a0ba93a2fe7d039a9d2e9b5ee8b49cf807ae35dc0'
        'SKIP'
        '8701fe5a816b13d98fe014792eaf7ab06f7b3c551a2f1e75a5cad82fbb6eea901123dba0765d5b44bab77653dd9a5556acdb8aa77926baf7a5fef9f267f525e2'
        '5e869bf7f7d0fcf646ae1652b71d032f28e7aac1edc62f0c99aa6285983500ba5f8f95d4d0f6af54b4d892edbd791a8fc7b5819c2f3877e1626ea46027ce20f0')

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
  mv -v build/{Data,BillyFrontier} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/billyfrontier-desktopicon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md Instructions.pdf
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
