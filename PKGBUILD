# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgname=avahi
pkgname=avahi-gtk2
pkgver=0.8+15+ge8a3dd0
pkgrel=1
pkgdesc='Multicast/unicast DNS-SD framework (with Gtk2 client apps)'
url='https://github.com/lathiat/avahi'
license=(LGPL)
arch=(x86_64 i686)
options=('!emptydirs')
depends=(expat libdaemon glib2 libcap gdbm dbus libevent)
makedepends=(git intltool gobject-introspection gtk2 xmltoman)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
optdepends=('gtk2: avahi-discover-standalone, bshell, bssh, bvnc, gtk2 bindings'
            'nss-mdns: NSS support for mDNS')
backup=(etc/avahi/{hosts,avahi-daemon.conf,avahi-{autoip,dnsconf}d.action})
_commit="e8a3dd0d480a754318e312e6fa66fea249808187"
source=("git+https://github.com/lathiat/avahi#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  export MOC_QT4=/usr/bin/moc-qt4
  export PYTHON=/usr/bin/python3

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --with-dbus-sys=/usr/share/dbus-1/system.d \
    --disable-monodoc \
    --disable-qt4 \
    --disable-qt5 \
    --disable-gtk3 \
    --disable-python \
    --disable-pygobject \
    --disable-python-dbus \
    --disable-mono \
    --disable-monodoc \
    --disable-doxygen-doc \
    --disable-doxygen-dot \
    --disable-doxygen-xml \
    --disable-doxygen-html \
    --enable-compat-libdns_sd \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

# cp -a avahi-python/avahi avahi-python/avahi2

  make
# make -C avahi-python/avahi2 PYTHON=/usr/bin/python2
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
# make DESTDIR="$pkgdir" -C avahi-python/avahi2 install \
#   PYTHON=/usr/bin/python2 pythondir=/usr/lib/python2.7/site-packages

  rmdir "$pkgdir/run"

# # this isn't ported
# sed -i '1s|python3|python2|' "$pkgdir/usr/bin/avahi-bookmarks"

  # mdnsresponder compat
  ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

  # move example services https://bugs.archlinux.org/task/47822
  install -d "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir"/etc/avahi/services/{,sftp-}ssh.service \
    "$pkgdir/usr/share/doc/$pkgname/"

  echo 'u avahi - "Avahi mDNS/DNS-SD daemon"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
