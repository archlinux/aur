# $Id$
# Maintainer: Oskari Rauta <oskari.rauta dot gmail.com>

pkgbase=network-manager-applet-passwordstore
_pkgbase="network-manager-applet"
pkgname=(nm-connection-editor-passwordstore network-manager-applet-passwordstore)
pkgdesc="Applet for managing network connections with default setting to save authentication passwords in keyfile and make all new connections available for all users"
conflicts=('nm-connection-editor' 'network-manager-applet')
provides=("nm-connection-editor=$pkgver-$pkgrel" "network-manager-applet=$pkgver-$pkgrel")
url="https://wiki.gnome.org/Projects/NetworkManager/"
pkgver=1.4.0
pkgrel=1
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
depends=(libnm-glib libgudev gtk3 mobile-broadband-provider-info iso-codes)
makedepends=(libsecret libnotify libmm-glib intltool gobject-introspection)
options=(!emptydirs)
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgbase/${pkgver:0:3}/$_pkgbase-$pkgver.tar.xz
	enable-local-password-storage.patch
	enable-new-connections-for-everyone-as-default.patch)
sha256sums=('d9f5f1e151b8edbbcebb6f818eed9a49b53aadcb4e8aed2cae4fc09996278331'
            'ae7232742e24d87c664479dac655c93a76db8dbbe52359144de21f573ed784c8'
            'b4c585b9beaac036e2b441d8952a99dd9f2532eeb3ba50081ca69761ffb40439')

prepare() {
  mkdir -p nma/etc/xdg nma/usr/bin \
    nma/usr/share/{applications,icons/hicolor/22x22/apps,man/man1,nm-applet}
  cd $_pkgbase-$pkgver
  patch -p1 -i ../enable-new-connections-for-everyone-as-default.patch
  patch -p1 -i ../enable-local-password-storage.patch
}

build() {
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-maintainer-mode \
      --disable-migration \
      --with-modem-manager-1

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgbase-$pkgver
  make -k check
}

package_nm-connection-editor-passwordstore() {
  pkgdesc="NetworkManager GUI connection editor with default settings to save authentication passwords in keyfile and make all new connections available for all users"
  provides=("libnm-gtk=$pkgver-$pkgrel" "nm-connection-editor=$pkgver-$pkgrel")
  conflicts=('libnm-gtk' 'nm-connection-editor')
  replaces=('libnm-gtk')

  cd $_pkgbase-$pkgver
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

package_network-manager-applet-passwordstore() {
  pkgdesc="Applet for managing network connections with default setting to save authentication passwords in keyfile and make all new connections available for all users"
  provides=("network-manager-applet=$pkgver-$pkgrel")
  depends=('nm-connection-editor-passwordstore' 'libmm-glib' 'libnotify' 'libsecret')
  conflicts=('network-manager-applet')
  mv nma/* "$pkgdir"
}
