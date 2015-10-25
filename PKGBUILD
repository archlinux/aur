# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=butter-git
_pkgname=butter
pkgver=r5479.150b1b9
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="https://butterproject.github.io/"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst')
makedepends=('git' 'nodejs-grunt-cli' 'bower' 'npm')
conflicts=('butter')
provides=('butter')
options=('!strip')
install="butter.install"

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

source=("butter.install"
        "git+https://github.com/butterproject/butter.git"
        "butter.desktop")
md5sums=('78dc3a0a3bd1dc75ea5bd8704ab1068d'
         'SKIP'
         'a16045882b270fb726de5d03c24626b4')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "$_pkgname"

  grunt bower_clean
  grunt nwjs
  grunt css
}

package() {
  _bpath="$_pkgname/build/Butter/$_platform"

  install -d "$pkgdir/usr/lib/butter"
  install -d "$pkgdir/usr/bin"

  # Program
  install -Dm755 "$_bpath/Butter" "$pkgdir/usr/lib/butter/"
  install -Dm644 "$_bpath/"{nw.pak,libffmpegsumo.so,icudtl.dat} "$pkgdir/usr/lib/butter/"

  # Link to program
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/butter/Butter" "$pkgdir/usr/bin/butter"

  # Desktop file
  install -Dm644 "butter.desktop" "$pkgdir/usr/share/applications/butter.desktop"

  # Icon
  install -Dm644 "$_pkgname/src/app/images/icon.png" "$pkgdir/usr/share/pixmaps/butter.png"
}
