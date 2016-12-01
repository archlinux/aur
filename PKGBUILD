# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from network-manager package)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-git
_gitname=NetworkManager
pkgname=(networkmanager-git libnm-glib-git)
pkgver=1.5.2.r16400.g9fafb38
pkgrel=1
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL2 LGPL2.1)
depends=(dbus-glib libmm-glib libndp libnewt libnl libsoup libteam libutil-linux
    nss polkit wpa_supplicant)
checkdepends=(libx11 python-gobject python-dbus)
_pppver=2.4.7
makedepends=(iproute2 nss polkit python-gobject dhclient git gobject-introspection gtk-doc intltool iptables
    modemmanager ppp=$_pppver rp-pppoe vala)
optdepends=('dhclient: DHCPv6 support'
    'dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'rp-pppoe: ADSL support'
    'modemmanager: cellular network support')
options=(!libtool !emptydirs)
source=($pkgname::git://github.com/$_gitname/$_gitname
    NetworkManager.conf)
sha256sums=('SKIP'
            '759db295ddae7a6dc6b29211fc0ec08695f875584d456dd146d3679e2c33e2e3')
sha512sums=('SKIP'
            'e7bb02132503f8c5d021ac0354f156c7775c35ea6590eb48143e7ff61b1b0b6507c3d9679c69d2315eb0e15c8805d41c2f6cbef2370058b34fc8eefc0f471bc3')

pkgver() {
    cd $pkgname/
    local ver=$({ echo 'changequote([,])dnl';
     sed -rn 's/^m4_(define.*nm_.*_version.*)/\1dnl/p' configure.ac;
      echo 'nm_major_version.nm_minor_version.nm_micro_version'; 
                echo 'define(AC_INIT,$2)dnl'
                grep '^AC_INIT(.*)' configure.ac; } | m4)
  local rev=$(git rev-list --count HEAD)
  local git=$(git rev-parse --short HEAD)
  echo "$ver.r$rev.g$git"
}

prepare() {
    cd $pkgname/
    2to3 -w libnm src tools

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $pkgname/
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/networkmanager \
        --with-crypto=nss \
        --with-dhclient=/usr/bin/dhclient \
        --without-dhcpcd \
        --with-iptables=/usr/bin/iptables \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-udev-dir=/usr/lib/udev \
        --with-resolvconf=/usr/bin/resolvconf \
        --with-pppd=/usr/bin/pppd \
        --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
        --with-pppoe=/usr/bin/pppoe \
        --with-kernel-firmware-dir=/usr/lib/firmware \
        --with-session-tracking=systemd \
        --with-modem-manager-1 \
        --enable-doc \
        --enable-gtk-doc \
        --enable-modify-system \
        --disable-static \
        --enable-more-warnings=no \
        --disable-wimax
     sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

    make

}

check() {
    make -kC $pkgname check
}

package_networkmanager-git() {
    depends=(libnm-glib iproute2 polkit wpa_supplicant libsoup libmm-glib
               libnewt libndp libteam)
    optdepends=('dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'rp-pppoe: ADSL support'
    'dhclient: External DHCP client'
    'modemmanager: cellular network support')
    backup=('etc/NetworkManager/NetworkManager.conf')
    conflicts=('networkmanager')
    provides=('networkmanager')
    cd $srcdir/$pkgname
    make -C $srcdir/$pkgname DESTDIR="$pkgdir" install
            # Some stuff to move is left over
            install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"
            install -m755 -d "$pkgdir/etc/NetworkManager/dnsmasq.d"
            rm -rv "$pkgdir/usr/lib"
            rm -rv "$pkgdir/usr/include"
            rm -rv "$pkgdir/var/run"
     }     

   package_libnm-glib-git() {
     pkgdesc="NetworkManager library"
       depends=(libgudev nss dbus-glib libutil-linux jansson)
       conflicts=('libnm-glib')
       provides=('libnm-glib')
          cd $srcdir/$pkgbase
          make DESTDIR="$pkgdir" install

          rm -rv "$pkgdir/usr/bin"
          rm -rv "$pkgdir/usr/share"
          rm -rv "$pkgdir/etc"
 }

  

