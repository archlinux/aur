# Maintainer: Wayne Hartmann <teodh4@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Hyperair <hyperair@gmail.com>
# Contributor: kumico <norrian@gmail.com>
# Contributor: adamruss <mail@russ.co.il>

pkgname=gnome-rdp
pkgver=0.3.1.0
pkgrel=3
pkgdesc="Remote desktop client for the GNOME Desktop with RDP/VNC/SSH capabilities, written in C Sharp"
arch=('any')
url="http://sourceforge.net/projects/gnome-rdp/"
license=('GPL' 'LGPL')
depends=('gtk-sharp-2' 'gnome-keyring-sharp')
optdepends=('openssh: SSH client'
            'gnome-terminal: required for the SSH client'
            'rdesktop: RDP client'
            'tightvnc: VNC client')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        appindicator.patch)
md5sums=('3c1329702914f8b1c213c0bb00d078cf'
         '7bbe98eadfe199c5664fd69a4531fb3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/tight-vncviewer/vncviewer/' Sessions/SessionCollection.cs
  patch -R -Np3 -i "$srcdir/appindicator.patch"
  sed -i 's/pkglib_SCRIPTS/programfiles_SCRIPTS/' Makefile.include
  sed -i 's|@expanded_libdir@|@prefix@/@libdir@|' gnome-rdp.in

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install desktop and icon files
  install -Dm644 Menu/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 Menu/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Runtime work-around
  sed -i "s|exec mono.*|exec mono \-\-runtime\=v4\.0 \"\/usr\/\$\{exec\_prefix\}\/lib\/gnome\-rdp\/gnome\-rdp\.exe\" \"\$\@\"|g" "$pkgdir/usr/bin/gnome-rdp"
}
