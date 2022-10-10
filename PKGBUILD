# Maintainer: Kai <kaibbusinessinq@gmail.com>
# Contributor: David Manouchehri <d@32t.ca>

pkgname=xf86-input-xwiimote-git
_gitname=xf86-input-xwiimote
_gitauthor=dvdhrm
pkgver=0.5.r0.gbb1528d
pkgrel=1
pkgdesc='X.Org Nintendo Wii Remote input driver'
arch=('i686' 'x86_64')
url="https://github.com/$_gitauthor/$_gitname"
license=('MIT')
depends=('xwiimote' 'udev')
makedepends=('xorg-server-devel>=1.10.99.902')
conflicts=('xorg-server<1.10.99.902' 'xf86-input-xwiimote')
providers=('xf86-input-xwiimote')
options=(!libtool)
source=("https://github.com/$_gitauthor/$_gitname.git")
sha512sums=('SKIP')

build() {
  mkdir -p "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  mkdir -p "$srcdir/$_gitname/m4"
  git clone https://github.com/dvdhrm/xf86-input-xwiimote m4
  autoreconf -i $srcdir/$_gitname/m4 || exit 1 ##normal to get a warning
  cd "$srcdir/$_gitname/m4"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname/m4"
  mkdir -p "$pkgdir/usr/share/licenses/$_gitname"
  cp COPYING "$pkgdir/usr/share/licenses/$_gitname"
  mkdir -p "$pkgdir/etc/X11/xorg.conf.d/"
  cp "60-xorg-xwiimote.conf" "$pkgdir/etc/X11/xorg.conf.d/60-xwiimote.conf"
  make DESTDIR="$pkgdir/" install
}
