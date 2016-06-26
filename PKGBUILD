# Maintainer: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-git
_gitname=rofi
pkgver=1.1.0.r30.g4af6976
pkgrel=1
pkgdesc="A window switcher, run dialog and dmenu replacement"
arch=('i686' 'x86_64')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=(libx11 libxft freetype2 libxdg-basedir pango startup-notification
         libxcb libxkbcommon libxkbcommon-x11 xcb-util xcb-util-wm xcb-util-xrm)
optdepends=('i3-wm: use as a window switcher')
makedepends=('git')
provides=('rofi')
conflicts=('rofi')
source=("git+https://github.com/DaveDavenport/rofi")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init
  autoreconf --install

  # Default compiler = clang, which can be a problem if using hardening-wrapper
  CC=gcc ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rofi/COPYING"
  install -dm755 "$pkgdir/usr/share/doc/rofi/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}
