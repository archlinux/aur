# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: L42y <423300@gmail.com>


pkgbase=network-manager-applet
pkgname=network-manager-applet-git
pkgver=1.1.0.r3454.g1cf5002
pkgrel=1
pkgdesc="Applet for managing network connections"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager-git' 'gtk3' 'iso-codes' 'libsecret'
         'notification-daemon' 'libnotify' 'adwaita-icon-theme'
         'mobile-broadband-provider-info' )
         
makedepends=('intltool' 'gobject-introspection')
provides=('network-manager-applet' 'nm-connection-editor' 'libnm-gtk')
conflicts=('nm-connection-editor' 'network-manager-applet')
options=('!libtool')
install=${pkgbase}-git.install
source=(git://git.gnome.org/network-manager-applet)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
           cd $pkgbase/
           local ver=$({ echo 'changequote([,])dnl';
           sed -rn 's/^m4_(define.*nm_.*_version.*)/\1dnl/p' configure.ac;
           echo '1.1.0'; 
           echo 'define(AC_INIT,$2)dnl'
           grep '^AC_INIT(.*)' configure.ac; } | m4)
           local rev=$(git rev-list --count HEAD)
           local git=$(git rev-parse --short HEAD)
          echo "$ver.r$rev.g$git"
                                                      }

build() {
	cd network-manager-applet
	
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/networkmanager \
		--disable-static \
		--disable-maintainer-mode \
		--disable-migration \
		--without-modem-manager-1       
	
   sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd network-manager-applet
  make DESTDIR="$pkgdir" install
}


