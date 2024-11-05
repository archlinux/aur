# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bugdom
pkgver=1.3.4
pkgrel=1
pkgdesc="Save Bugdom from Thorax's evil Fire Ants"
arch=('x86_64')
url='https://github.com/jorio/Bugdom'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
sha512sums=('36e64ce675ab8c7fe463c6eb2094a9aa6b1be91082e534932454511b3972c5daf214ab28d71d50caf03955d1e94dc2b17aa2b1668711019e7a7a419e48b2b663'
            'SKIP'
            '69dadaa4ceede2c89c2b3e52f28d1c20f8d5b6dc68260464002699ff5d13b4b737cc6963e90c7360af18cf13cab293c27f7526dd6dcad3a4ac37204803e720e1'
            '10f2aa8d100d16c0a4bef0d42b15b5ac53d561baf6835e43f09f650c7e807259f8e5356f58fd126f0e2a6b631bc92844b4015b59a9e1c5c333d78c70722d628e')
b2sums=('8f401a082b48977c931b73325574cbcc56ecb8993147cc4c982fc4a179a68148efc59ed3fe5e210833cc11d5ee63e19847a53c4492eb620282258e655c44ff98'
        'SKIP'
        'f8c230b4047950d3f5f733e795b6ea0082a59348bdf44716ed027f0b7ccd1472c5663f8c8dc19e4548a0cc628c17ffa1f52a5011eb6ee70a33afbeae4a2e9e8c'
        '62176cb077576d5274818dfe1d297856ed2d284a7e137dda812682758655275a476c7449ec9d51929c6fbf804f1fea789e91d241ee7ffd14e9b02c418bc097ff')

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
