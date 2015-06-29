#Contributor: Dave Reisner <d@falconindy.com>
#Maintainer: aksr <aksr at t-com dot me>
pkgname=uuterm-svn
pkgver=80
pkgrel=3
pkgdesc="A portable VT100-like terminal emulator with minimal code and memory footprint and maximal Unicode support."
arch=('i686' 'x86_64')
url="http://www.etalabs.net/uuterm.html"
license=('GPLv2')
groups=()
depends=('libx11' 'ncurses')
makedepends=('subversion')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
replaces=()
backup=()
options=()
install=${pkgname%-svn}.install
source=("${pkgname%-svn}::svn+svn://svn.mplayerhq.hu/uuterm/trunk/")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-svn}"
  printf "%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
  cd "$srcdir/${pkgname%-svn}"
  # honor build flags
  for flags in {C,LD}FLAGS; do
    [[ ${!flags} ]] && printf '%s = %s\n' "$flags" "${!flags}"
  done > config.mak
}

build() {
  cd "$srcdir/${pkgname%-svn}"
  make all uuterm-fb
}

package() {
  cd "$srcdir/${pkgname%-svn}"
  # compile terminfo
  install -dm755 "$pkgdir/usr/share/terminfo"
  tic -o "$pkgdir/usr/share/terminfo" uuterm.ti
  # ucf is the new hotness
  install -Dm644 ytty/ytty.ucf "$pkgdir/usr/share/fonts/ucf/ytty.ucf"
  install -Dm755 uuterm-x11 "$pkgdir/usr/bin/uuterm-x11"
  install -Dm755 uuterm-fb "$pkgdir/usr/bin/uuterm-fb"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/uuterm/COPYING"
}

