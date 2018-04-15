# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>
pkgname=dhcpcd-ui-patched
_pkgname=dhcpcd-ui
pkgver=0.7.5
pkgrel=1
pkgdesc="dhcpcd Monitor in GTK+, patched with AppIndicator support"
url="http://roy.marples.name/projects/dhcpcd-ui"
license=("BSD")
depends=("gtk3" "libappindicator-gtk3" "libnotify" "dhcpcd-dbus>=0.6.0" "hicolor-icon-theme")
provides=('dhcpcd-ui')
conflicts=('dhcpcd-ui')
source=("http://roy.marples.name/downloads/dhcpcd/$_pkgname-$pkgver.tar.bz2"
        "add-appindicator-support.patch")
arch=(i686 x86_64)
md5sums=('ff937ffe2ffc2801488078a61bdbfd0d'
         'bc618c307d0d27ce7f9a12a2a2e077a4')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 < "${srcdir}/add-appindicator-support.patch"
  ./configure --prefix=/usr --icondir=/usr/share/icons --with-gtk=gtk+-3.0 --without-qt
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir/" AUTOSTARTDIR=/etc/xdg/autostart install 

  install -d "$pkgdir/usr/share/licenses/$_pkgname"
  sed -n '1,/^$/p' src/dhcpcd-gtk/main.c \
	>"$pkgdir/usr/share/licenses/$_pkgname/license.txt"
}
