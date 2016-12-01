# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: L42y <423300@gmail.com>


pkgbase=network-manager-applet-git
pkgname=(nm-connection-editor-git network-manager-applet-git)
pkgver=1.4.3.dev.r96.g8c44cbe
pkgrel=1
pkgdesc="Applet for managing network connections"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=(libnm-glib-git libgudev gtk3 mobile-broadband-provider-info iso-codes)
makedepends=(libsecret libnotify libmm-glib intltool gobject-introspection git)
options=('!libtool' 'emptydirs')
source=(git://git.gnome.org/network-manager-applet)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
           cd $srcdir/network-manager-applet/
           git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
       }
prepare(){
mkdir -p nma/etc/xdg nma/usr/bin \
    nma/usr/share/{applications,icons/hicolor/22x22/apps,man/man1,nm-applet}
  cd $srcdir/network-manager-applet
  NOCONFIGURE=1 ./autogen.sh

}
build() {
	cd $srcdir/network-manager-applet
	
	./configure --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/networkmanager \
		--disable-static \
		--disable-maintainer-mode \
		--disable-migration \
		--without-modem-manager-1       
	
   sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $srcdir/network-manager-applet
  make -k check
}

package_nm-connection-editor-git() {
  pkgdesc="NetworkManager GUI connection editor and widgets"
  provides=("libnm-gtk=$pkgver-$pkgrel" "nm-connection-editor")
  conflicts=(libnm-gtk nm-connection-editor)
  replaces=(libnm-gtk nm-connection-editor)

  cd $srcdir/network-manager-applet
  make DESTDIR="$pkgdir" install

### Split network-manager-applet
  cd ../nma
  mv "$pkgdir"/etc/xdg/autostart etc/xdg/
  mv "$pkgdir"/usr/bin/nm-applet usr/bin/
  mv "$pkgdir"/usr/share/GConf usr/share/

  cd usr/share
  mv "$pkgdir"/usr/share/applications/nm-applet.desktop applications/
  mv "$pkgdir"/usr/share/man/man1/nm-applet.1 man/man1/
  mv "$pkgdir"/usr/share/nm-applet/{{8021x,gsm-unlock,info}.ui,keyring.png} nm-applet/
  
  cd icons/hicolor/22x22
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{adhoc,mb-roam,wwan-tower}.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{secure,vpn-active}-lock.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{signal,tech}-*.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-*connecting*.png apps/
}

package_network-manager-applet-git() {
  provides=("network-manager-applet")
  conflicts=(network-manager-applet)
  replaces=(network-manager-applet)
  depends=(nm-connection-editor libmm-glib libnotify libsecret)
  mv nma/* "$pkgdir"
}


