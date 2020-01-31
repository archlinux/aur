# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=avahi-git
pkgver=v0.7.r59.g4a5454f
pkgrel=1
pkgdesc='Multicast DNS-SD / Zeroconf Suite git master'
url='http://www.avahi.org/'
license=(LGPL)
arch=(i686 x86_64)
depends=(expat libdaemon glib2 libcap gdbm dbus)
makedepends=(git qt5-base pygtk mono intltool expat dbus gtk-sharp-2 gobject-introspection gtk3 xmltoman python-dbus nss-mdns python-gobject)
optdepends=('gtk3: avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'pygtk'
            'qt5-base: qt bindings'
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

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    with_dbus_sys=/usr/share/dbus-1/system.d \
    --disable-monodoc \
    --disable-qt4 \
    --enable-compat-libdns_sd \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd avahi
  make DESTDIR="$pkgdir" install

  rmdir "$pkgdir/run"
  
  # this isn't ported
  sed -i '1s|python3|python2|' "$pkgdir/usr/bin/avahi-bookmarks"

  # mdnsresponder compat
  ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

  # move example services https://bugs.archlinux.org/task/47822
  install -d "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir"/etc/avahi/services/{,sftp-}ssh.service \
    "$pkgdir/usr/share/doc/$pkgname/"

  echo 'u avahi - "Avahi mDNS/DNS-SD daemon"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
