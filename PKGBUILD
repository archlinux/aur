# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: SirPatrickCZ Fiala456@gmail.com
pkgname="st-spcz-git"
_pkgname="st"
pkgver=0.8.1.r0.g8936abb
pkgrel=1
pkgdesc="Simple terminal emulator by suckless.org with mouse-scroll and alpha patches."
arch=('i686' 'x86_64' 'armv7h' 'armv7l')
url="https://github.com/SirPatrickCZ/st"
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('git' 'ncurses' 'libxext')
optdepends=('xorg-fonts-misc')
conflicts=('st')
source=("st::git+https://github.com/SirPatrickCZ/st.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  # skip terminfo which conflicts with nsurses
  sed -i '/tic /,+1d' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
