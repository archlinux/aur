# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=billy-frontier
pkgver=1.1.0
pkgrel=1
pkgdesc='An arcade action game with a "cowboys in space" theme'
arch=('x86_64')
url='https://github.com/jorio/BillyFrontier'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
_commit='337fa270b6d97b0384a2b5e1da84b6778223e556'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        '8701fe5a816b13d98fe014792eaf7ab06f7b3c551a2f1e75a5cad82fbb6eea901123dba0765d5b44bab77653dd9a5556acdb8aa77926baf7a5fef9f267f525e2'
        '600b967e943c01377d6c1cc887d72ba45102e169194aa76f7ec44fc73560e3da648c9058793986eeacfc3c92573df0c5628aec69f0d35e5dd2df92048b3a6c0b')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup Git submodules
  git submodule init
  git config submodule.Pomme.url ../Pomme
  git -c protocol.file.allow=always submodule update
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
