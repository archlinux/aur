# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=cro-mag-rally
pkgname="${_pkgname}-net"
pkgver=3.0.0
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgdesc='The wildest racing game since man invented the wheel! Experimental LAN build.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jm2/CroMagRally'
license=('custom:CC-BY-NC-SA-4.0')
depends=('sdl2' 'glu' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
_commit='a0a60c09652df686f50968cf25f040db2268874e'
source=(
  "$_pkgname::git+$url.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$_pkgname.desktop"
  "$_pkgname.sh"
)
b2sums=('SKIP'
        'SKIP'
        '2395a1f207c58e1ffdfe9a6036b99ad7ea3a19f6ab7a0418ed7c256f8c32ccfedf69924bfa3af807dfb7db33457d237d55f5b89566fc1ba87e182d701947eca9'
        'ca267b6b8f9a0d1a8202bd938abbfe641ca1d8dbcf6d645bc311303a5fa407096648e4abb18c39c8324b8174295840daef67dea82e39866d3a7d89f06edb9a3c')

prepare() {
  cd "$_pkgname"

  # handle git submodules
  git submodule init
  git config submodule.extern/Pomme.url ../Pomme
  git submodule--helper update
}

build() {
  cd "$_pkgname"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

package() {
  cd "$_pkgname"

  # move binary & assets
  install -vd "$pkgdir/usr/lib/$_pkgname"
  install -vDm755 -t "$pkgdir/usr/lib/$_pkgname" build/CroMagRally
  mv -v build/Data "$pkgdir/usr/lib/$_pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$_pkgname.desktop"
  install -vDm644 packaging/cromagrally-desktopicon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" *.md
  rm -vf "$pkgdir/usr/share/doc/$_pkgname/LICENSE.md"
  cp -vr docs "$pkgdir/usr/share/doc/$_pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$_pkgname/README"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE.md
}
