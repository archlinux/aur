# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ottomatic
pkgver=4.0.0
pkgrel=1
pkgdesc="Save Earth from the clutches of The Giant Brain from Planet X"
arch=('x86_64')
url="https://github.com/jorio/ottomatic"
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        'b3452a8f143877ab688212ca9bfe4cdcd174667298fedd7cdcba4d7b4a1c49bf86bca0e456bcd2c64039cc322c540a583f9ff2e820e3ef38c0ef15984c348ae8'
        'c8f7a247ba04156ee8b07ddcdcadcd75946f24347cbdc82363a02f8267a64db1f5b2a1326a1019d8d31c6697a7e5da409bdc52d6c28a0ecca7f9b8372933050c')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.Pomme.url ../Pomme
  git submodule update
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
}

build() {
  cd "$pkgname"
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
  install -vDm644 packaging/ottomatic-desktopicon.png \
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
