# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgname=avahi
pkgname=avahi-gtk2
pkgver=0.8+22+gfd482a7
pkgrel=1
pkgdesc='Multicast/unicast DNS-SD framework (with Gtk2 client apps)'
url='https://github.com/lathiat/avahi'
license=(LGPL)
arch=(x86_64 i686)
depends=(expat libdaemon glib2 libcap gdbm dbus)
makedepends=(git gobject-introspection gtk2 gtk3 qt5-base xmltoman python-dbus
	     python-gobject doxygen graphviz libevent)
optdepends=('gtk2: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
	    'gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
            'qt5-base: qt5 bindings'
            'libevent: libevent bindings'
            'nss-mdns: NSS support for mDNS'
            'python-twisted: avahi-bookmarks'
            'python-gobject: avahi-bookmarks, avahi-discover'
            'python-dbus: avahi-bookmarks, avahi-discover')
provides=(libavahi-client.so libavahi-common.so libavahi-core.so
          libavahi-glib.so libavahi-gobject.so libavahi-libevent.so
          libavahi-qt5.so libavahi-ui-gtk2.so libavahi-ui-gtk3.so libdns_sd.so
	  "${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
backup=(etc/avahi/{hosts,avahi-daemon.conf,avahi-{autoip,dnsconf}d.action}
        usr/lib/avahi/service-types.db)
_commit=fd482a74625b8db8547b8cfca3ee3d3c6c721423  # master
source=("git+https://github.com/lathiat/avahi#commit=$_commit"
        282.patch
        0001-Fix-avahi-browse-Invalid-service-type.patch)
sha512sums=('SKIP'
            '26b1e74450944f5c4385d2f5df18523cfb953e4138f6d9e81061a626453e40d8ed2dee44535cfbb547848eefb3cdca408009d5f0e0c465f144a8803db8593b46'
            'e39c17d9a5d534784a3c7b6947da994d0ab5fa354aac5cecde6d3baaa2bb3d57f02f91cc6fb68885a4e98f44efe615b01631a4c7af752aa26f35082cfcc0ddd7')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://bugs.archlinux.org/task/68518
  # https://github.com/lathiat/avahi/pull/282
  git apply -3 ../282.patch

  # https://bugs.archlinux.org/task/71781
  # https://github.com/lathiat/avahi/issues/212
  git apply -3 ../0001-Fix-avahi-browse-Invalid-service-type.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    with_dbus_sys=/usr/share/dbus-1/system.d \
    --enable-gtk \
    --enable-gtk3 \
    --disable-mono \
    --enable-compat-libdns_sd \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  depends+=(libdbus-1.so)

  cd $_pkgname
  make DESTDIR="$pkgdir" install

  rmdir "$pkgdir/run"

  # mdnsresponder compat
  ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

  # move example services https://bugs.archlinux.org/task/47822
  install -d "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir"/etc/avahi/services/{,sftp-}ssh.service \
    "$pkgdir/usr/share/doc/$pkgname/"

  echo 'u avahi - "Avahi mDNS/DNS-SD daemon"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
