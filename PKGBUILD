# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bugdom
pkgver=1.3.0
pkgrel=1
pkgdesc="Save Bugdom from Thorax's evil Fire Ants"
arch=(x86_64)
url="https://github.com/jorio/Bugdom"
license=('custom:CC-BY-NC-SA-4.0')
depends=(sdl2 glu hicolor-icon-theme)
makedepends=(cmake git)
source=("$pkgname::git+$url.git#tag=$pkgver"
        "git+https://github.com/jorio/Pomme.git"
        "git+https://github.com/jorio/Quesa.git"
        "$pkgname.desktop")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'f8c230b4047950d3f5f733e795b6ea0082a59348bdf44716ed027f0b7ccd1472c5663f8c8dc19e4548a0cc628c17ffa1f52a5011eb6ee70a33afbeae4a2e9e8c')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.Pomme.url ../Pomme
  git config submodule.Quesa.url ../Quesa
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

  # create dirs
  install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/share/doc/$pkgname"

  # move binary & assets
  mv build/{Data,Bugdom} "$pkgdir/usr/lib/$pkgname"

  # desktop file & icon
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -Dm644 \
    "$srcdir/$pkgname/cmake/Bugdom512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  cp "$srcdir/$pkgname/"docs/* "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname/LICENSE.md"
}
