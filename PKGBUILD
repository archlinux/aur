# Maintainer: Brian Bidulock <bidulock@openss7.org>

_pkgname=notification-daemon
pkgname=notification-daemon-gtk2
pkgver=0.5.0
pkgrel=4
pkgdesc="Notification daemon for the desktop notifications framework for GTK2"
arch=(i686 x86_64)
license=('GPL')
url="http://www.galago-project.org/specs/notification/"
depends=('libsexy>=0.1.11' 'libwnck>=2.28.0' 'gconf-gtk2>=2.28.0' 'gstreamer0.10-base>=0.10.25' 'libnotify>=0.4.5' 'libglade>=2.6.4' 'hicolor-icon-theme')
groups=('gnome')
makedepends=('pkgconfig' 'intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
replaces=(${_pkgname})
options=('!libtool' '!emptydirs')
install=notification-daemon.install
source=(http://download.gnome.org/sources/${_pkgname}/0.5/${_pkgname}-${pkgver}.tar.bz2
	libnotify.patch)
md5sums=('18919b2aa2a88b71a40f59393edf70d0'
         'baf7f42dd226f2da7a02d6605ca1e08f')

build() {
  cd "${srcdir}"
  patch -p 0 <libnotify.patch
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
      NOTIFICATION_DAEMON_LIBS='-ldbus-glib-1 -ldbus-1 -lcanberra-gtk -lX11 -lcanberra -lgdk-x11-2.0 -lgconf-2 -lwnck-1 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lfreetype -lfontconfig -lX11 -lgmodule-2.0' \
      --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/notification-daemon-1.0 \
      --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain notification-daemon ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
