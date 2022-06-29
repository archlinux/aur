# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=cro-mag-rally
pkgver=3.0.0
pkgrel=1
pkgdesc='The wildest racing game since man invented the wheel!'
arch=('x86_64')
url='https://github.com/jorio/CroMagRally'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
_commit='b05c1428a5c25c0bef7d4c6fe9323d14780e82f2'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        '2395a1f207c58e1ffdfe9a6036b99ad7ea3a19f6ab7a0418ed7c256f8c32ccfedf69924bfa3af807dfb7db33457d237d55f5b89566fc1ba87e182d701947eca9'
        'ca267b6b8f9a0d1a8202bd938abbfe641ca1d8dbcf6d645bc311303a5fa407096648e4abb18c39c8324b8174295840daef67dea82e39866d3a7d89f06edb9a3c')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # handle git submodules
  git submodule init
  git config submodule.extern/Pomme.url ../Pomme
  git submodule update
}

build() {
  cd "$pkgname"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

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
  install -vDm644 packaging/cromagrally-desktopicon.png \
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
