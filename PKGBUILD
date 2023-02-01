# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ottomatic
pkgver=4.0.1
pkgrel=1
pkgdesc='Save Earth from the clutches of The Giant Brain from Planet X'
arch=('x86_64')
url='https://github.com/jorio/ottomatic'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
_commit='197b5d45869124c29a8161d863f186f27cf4db0f'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        'b3452a8f143877ab688212ca9bfe4cdcd174667298fedd7cdcba4d7b4a1c49bf86bca0e456bcd2c64039cc322c540a583f9ff2e820e3ef38c0ef15984c348ae8'
        'c8f7a247ba04156ee8b07ddcdcadcd75946f24347cbdc82363a02f8267a64db1f5b2a1326a1019d8d31c6697a7e5da409bdc52d6c28a0ecca7f9b8372933050c')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url "$srcdir/github.com-jorio-Pomme"
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
  mv -v build/{Data,OttoMatic} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/io.jor.ottomatic.png \
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
