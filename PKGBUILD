# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bugdom
pkgver=1.3.3
pkgrel=1
pkgdesc="Save Bugdom from Thorax's evil Fire Ants"
arch=('x86_64')
url='https://github.com/jorio/Bugdom'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
_commit='85e88ea7cde3cd63f94fbd0cac6358f7d33b1c66'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        'f8c230b4047950d3f5f733e795b6ea0082a59348bdf44716ed027f0b7ccd1472c5663f8c8dc19e4548a0cc628c17ffa1f52a5011eb6ee70a33afbeae4a2e9e8c'
        '62176cb077576d5274818dfe1d297856ed2d284a7e137dda812682758655275a476c7449ec9d51929c6fbf804f1fea789e91d241ee7ffd14e9b02c418bc097ff')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

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
  mv -v build/{Data,Bugdom} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/Bugdom512.png \
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
