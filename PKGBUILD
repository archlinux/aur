pkgname=choosewm
pkgver=0.1.6
pkgrel=2
pkgdesc="Choose WM gui tool. Run it from ~/.xsession or ~/.xinitrc."
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/x11/choosewm"
license=('GPL')
depends=(gtk2)
options=(zipman)
source=(http://ftp.de.debian.org/debian/pool/main/c/choosewm/choosewm_$pkgver.orig.tar.gz
	http://http.debian.net/debian/pool/main/c/choosewm/choosewm_$pkgver-3.debian.tar.gz)
sha256sums=('10f1aedfccd3f8c39766cabb017fe3fa1acd349a6cfa0641e55d5e9b0f3b142b'
            'd753c6d2fd2b753d3eb3b2439a2c49e9f3802641bdc64e63617147bc81c0b3b9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cat ../debian/patches/series | while read p; do
    patch -p1 <$srcdir/debian/patches/$p
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPPFLAGS="$(pkg-config --cflags gtk+-2.0)" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  mkdir -p $pkgdir/var/lib/choosewm
  cat >$pkgdir/var/lib/choosewm/windowmanagers <<EOF
Trivial Window Manager=/usr/bin/twm
KDE=/usr/bin/startkde
Gnome=/usr/bin/gnome-session
Xfce=/usr/bin/xfce4-session
IceWM=/usr/bin/icewm
Ion3=/usr/bin/ion3
FvWM=/usr/bin/fvwm
EOF
}
