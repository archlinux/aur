# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=nanosaur
pkgver=1.4.1
pkgrel=3
pkgdesc="Play as a cybernetic dinosaur in this third-person shooter"
arch=(x86_64)
url="https://github.com/jorio/Nanosaur"
license=('custom:pangea')
# License sourced from http://www.pangeasoft.net/nano/nanosource.html
# Decent guidelines for gaming packages: https://fedoraproject.org/wiki/SIGs/Games/Packaging
depends=(sdl2 glu hicolor-icon-theme)
makedepends=(cmake git)
source=("$pkgname::git+https://github.com/jorio/Nanosaur.git#tag=v$pkgver"
        "git+https://github.com/jorio/Pomme.git"
        "git+https://github.com/jorio/Quesa.git"
        LICENSE
        "$pkgname.desktop"
        "$pkgname.sh")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'ff25be6bd681b6d54b7ae97f81611bf601fad532ac413c90f2d683e252ada8015da1a24cf830b90d6d3c78463505d55044b58b457351fdae56f14fe2ab9ca754'
        'a58f80a565d56b634a3ca70867779c469755828c44c26261553b3d7e663d32204318ef29500596668e1de2c4a16068200430820f3dd2c459da1d8265ebe5b78f'
        '21824ed76dd1150c5c7c84e4d580959c2bab00c54d9c558ee1565f63f864a4be3bf745e0d436720a71273efb0b9077cf93477ec977b46dd78bd552786569ec74')

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
  mv build/{Data,Nanosaur} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"

  # desktop file & icon
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -Dm644 \
    "$srcdir/$pkgname/cmake/Nanosaur.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  cp "$srcdir/$pkgname/"docs/* "$pkgdir/usr/share/doc/$pkgname"
}
