# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=butter-git
_pkgname=butter-desktop
pkgver=r5891.6365715
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="https://butterproject.github.io/"
license=('GPL3')
depends=('alsa-lib'
         'gconf'
         'gtk2'
         'libxtst'
         'nss'
         'ttf-font')
makedepends=('bower'
             'cmake'
             'git'
             'gulp'
             'npm')
conflicts=('butter')
provides=('butter')
options=('!strip')
install="butter.install"

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

source=("git+https://github.com/butterproject/$_pkgname.git"
        "butter.desktop")
md5sums=('SKIP'
         '280e34e43de9356edf68cc7d17aab99b')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  npm install
}

build() {
  cd "$_pkgname"
  gulp clean
  gulp css
  gulp nwjs
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

  install -Dm644 "butter.desktop" "$pkgdir/usr/share/applications/butter.desktop"
  install -Dm644 "$_pkgname/src/app/images/icon.png" "$pkgdir/usr/share/pixmaps/butter.png"
  install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
