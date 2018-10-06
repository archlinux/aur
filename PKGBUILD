# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Additional participation: Nikita Tarasov <nikatar@disroot.org>

pkgbase=network-manager-applet-indicator
pkgname=(nm-connection-editor-indicator network-manager-applet-indicator)
pkgdesc="Latest nm-applet with Appindicator/StatusNotifierItem support from Gnome GitLab"
url="https://aur.archlinux.org/packages/network-manager-applet-indicator/"
pkgver=1.8.19+dev+17+g57ef36bf
pkgrel=1
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
depends=(libnm-glib libgudev gtk3 mobile-broadband-provider-info iso-codes libappindicator-gtk3)
makedepends=(libsecret libnotify libmm-glib intltool gobject-introspection git gtk-doc)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git/")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-indicator}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir -p nma/etc/xdg nma/usr/bin \
    nma/usr/share/{applications,icons/hicolor/22x22/apps,man/man1,nm-applet}
  cd ${pkgbase%-indicator}
  NOCONFIGURE=1 ./autogen.sh
  sed -i -e 's/Exec=nm-applet/Exec=nm-applet --indicator/' nm-applet.desktop.in
}

build() {
  cd ${pkgbase%-indicator}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    runstatedir=/run \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-maintainer-mode \
    --disable-static \
    --enable-gtk-doc \
    --enable-introspection \
    --enable-ld-gc \
    --with-team \
    --with-wwan \
    --with-appindicator \
    --without-selinux

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd ${pkgbase%-indicator}
  make -k check
}

package_nm-connection-editor-indicator() {
  pkgdesc="NetworkManager GUI connection editor and widgets, with AppIndicator"
  provides=("libnm-gtk=${pkgver}-${pkgrel}" "libnma=${pkgver}-${pkgrel}" "nm-connection-editor=${pkgver}-${pkgrel}")
  conflicts=(libnm-gtk)
  replaces=(libnm-gtk)

  cd ${pkgbase%-indicator}
  make DESTDIR="$pkgdir" install

### Split network-manager-applet-indicator
  cd ../nma
  mv "$pkgdir"/etc/xdg/autostart etc/xdg/
  mv "$pkgdir"/usr/bin/nm-applet usr/bin/
  mv "$pkgdir"/usr/share/GConf usr/share/

  cd usr/share
  mv "$pkgdir"/usr/share/applications/nm-applet.desktop applications/
  mv "$pkgdir"/usr/share/man/man1/nm-applet.1 man/man1/

  cd icons/hicolor/22x22
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{adhoc,mb-roam,wwan-tower}.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{secure,vpn-active}-lock.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-{signal,tech}-*.png apps/
  mv "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-*connecting*.png apps/
}

package_network-manager-applet-indicator() {
    depends=(nm-connection-editor libmm-glib libnotify libsecret libappindicator-gtk3)
    provides=(network-manager-applet=$pkgver-$pkgrel)
    conflicts=(network-manager-applet)
    mv nma/* "$pkgdir"
}
