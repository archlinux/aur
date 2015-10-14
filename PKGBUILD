# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=avahi-git
pkgver=0.6.32.rc.r7.g916f65b
pkgrel=1
pkgdesc='Multicast DNS-SD / Zeroconf Suite git master'
url='http://www.avahi.org/'
license=(LGPL)
arch=(i686 x86_64)
depends=(expat libdaemon glib2 libcap gdbm dbus)
makedepends=(git qt4 pygtk mono intltool python2-dbus gtk-sharp-2 gobject-introspection gtk3
             xmltoman python-dbus)
optdepends=('gtk3: avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'qt4: qt4 bindings'
            'pygtk: avahi-bookmarks, avahi-discover'
            'python2-twisted: avahi-bookmarks'
            'mono: mono bindings'
            'python2-dbus: avahi-discover'
            'nss-mdns: NSS support for mDNS')
conflicts=(howl mdnsresponder avahi)
provides=(howl mdnsresponder avahi)
install=avahi.install
options=(!emptydirs)
backup=(etc/avahi/{hosts,avahi-daemon.conf,services/{ssh,sftp-ssh}.service}
        usr/lib/avahi/service-types.db usr/share/avahi/service-types)
source=("git://github.com/lathiat/avahi")
sha256sums=('SKIP')

pkgver() {
  cd avahi
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd avahi
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd avahi
  export MOC_QT4=/usr/bin/moc-qt4 PYTHON=/usr/bin/python2

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --disable-monodoc \
    --disable-qt3 \
    --enable-compat-libdns_sd \
    --enable-compat-howl \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  cp -a avahi-python/avahi avahi-python/avahi3

  make
  make -C avahi-python/avahi3 PYTHON=/usr/bin/python3
}

package() {
  cd avahi
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C avahi-python/avahi3 install \
    PYTHON=/usr/bin/python3 pythondir=/usr/lib/python3.5/site-packages

  # howl compat
  ln -s avahi-compat-howl "$pkgdir/usr/include/howl"
  ln -s avahi-compat-howl.pc "$pkgdir/usr/lib/pkgconfig/howl.pc"

  # mdnsresponder compat
  ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

  # see FS#42638
  ln -s avahi-daemon.service "$pkgdir/usr/lib/systemd/system/dbus-org.freedesktop.Avahi.service"
}
