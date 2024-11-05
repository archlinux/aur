# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=cro-mag-rally
pkgver=3.0.1
pkgrel=1
pkgdesc='The wildest racing game since man invented the wheel!'
arch=('x86_64')
url='https://github.com/jorio/CroMagRally'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
sha512sums=('8cbbc3d2b3d2f18a896cd2bde57ab2b11ba3b65dfe38667b80228a4547346e68f9c64c7600286d607debc4bdb05f4843a52d061085f973f59ff09c2e49ed8d38'
            'SKIP'
            '73c2b7fefea39b32c4b7b0b98a33e036fd939ef7a6190d297e2265c3aaeb74907b052db4be09cbd349ebb44588f6dc88dd97a053f8149271fe9740d5aedafcda'
            '0be6bc00784a6a9b5c4ed83ac9be1b048ca9ba65b07b0c3510fca27161e0987ebb17dd1f1f2c5cd0a28478e5d45669fb2f477bbb9852ea7cd597b79d8021a510')
b2sums=('60bf0766365975f5e7f86bc0d010db4d96268a858267a14d195229df05f5825e39ff35bd2ef575f16c3a924d629c49f3ab470a810add57e0118766b7a308412a'
        'SKIP'
        '2395a1f207c58e1ffdfe9a6036b99ad7ea3a19f6ab7a0418ed7c256f8c32ccfedf69924bfa3af807dfb7db33457d237d55f5b89566fc1ba87e182d701947eca9'
        'ca267b6b8f9a0d1a8202bd938abbfe641ca1d8dbcf6d645bc311303a5fa407096648e4abb18c39c8324b8174295840daef67dea82e39866d3a7d89f06edb9a3c')

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
  #mv -v build/{Data,Bugdom} "$pkgdir/usr/lib/$pkgname"
  install -vDm755 -t "$pkgdir/usr/lib/$pkgname" build/CroMagRally
  mv -v build/Data "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/io.jor.cromagrally.png \
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
