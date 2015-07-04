# Maintainer: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-git
_gitname=rofi
pkgver=0.15.5.r37.g5c9ad80
pkgrel=1
pkgdesc="Popup window switcher roughly based on superswitcher, requiring only xlib and xft. DaveDavenport's fork"
arch=('i686' 'x86_64')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2' 'libxdg-basedir' 'libxinerama')
optdepends=('i3-wm: use as a window switcher')
makedepends=('autoconf' 'git')
provides=('rofi')
conflicts=('rofi')
source=("git+https://github.com/DaveDavenport/rofi")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  # Install examples to /usr/share/rofi
  install -m 755 -d "$pkgdir/usr/share/rofi/"
  for example in `find "Examples" -type f -name "*.sh"`
  do
    install -m 755 "$example" "$pkgdir/usr/share/rofi/$(basename $example)"
  done
}
