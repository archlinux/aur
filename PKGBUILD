pkgname=choosewm
pkgver=0.1.6
pkgrel=1
pkgdesc="Choose WM gui tool. Run it from ~/.xsession or ~/.xinitrc."
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/x11/choosewm"
license=('GPL')
depends=(gtk2)
options=(zipman)
source=(http://ftp.de.debian.org/debian/pool/main/c/choosewm/choosewm_$pkgver.orig.tar.gz \
	http://ftp.de.debian.org/debian/pool/main/c/choosewm/choosewm_$pkgver-1.diff.gz)
md5sums=('f0a14f52a54ffdda40b64d1a43e6caaf'
         '8fa9e7e2ea406cf0b6348bb1cbde837e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 <$srcdir/choosewm_$pkgver-2.diff

  CPPFLAGS="-I/usr/lib/glib-2.0/include -I/usr/include/glib-2.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo" ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  mkdir -p $pkgdir/etc/alternatives $pkgdir/var/lib/choosewm
  ln -s /usr/bin/twm $pkgdir/etc/alternatives/x-window-manager && \
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
