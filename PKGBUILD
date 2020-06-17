# Maintainer: null2264 <palembani@gmail.com>
pkgname=st-ziro-git
_pkgname=st-zi
pkgver=0.8.3r1141.51ca861.zi
pkgrel=1
pkgdesc="ZiRO or AAP's personal build of st (simple terminal) with Xresources, transparency, etc."
url='https://github.com/null2264/st-zi.git'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
optdepends=('picom')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')

source=("git+$url"
	'st.desktop')
sha256sums=('SKIP' 'SKIP')
provides=('st')
conflicts=('st')

pkgver() {
  cd ${_pkgname}
  printf '%sr%s.%s.zi' "$(awk '/^VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  # skip terminfo which conflicts with ncurses
  sed -i '/tic /d' Makefile
}

build() {
  cd ${_pkgname}
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd ${_pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/st.desktop" "$pkgdir/usr/share/applications/st.desktop"
}
