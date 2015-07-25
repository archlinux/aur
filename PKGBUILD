# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from network-manager package)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

_gitname=NetworkManager
pkgname=networkmanager-git
pkgver=1.1.0.r12661.g72953e3
pkgrel=1
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL2 LGPL2.1)
depends=(dbus-glib libmm-glib libndp libnewt libnl libsoup libteam libutil-linux
    nss polkit wpa_supplicant)
checkdepends=(libx11 python-gobject python-dbus)
_pppver=2.4.7
makedepends=(dhclient git gobject-introspection gtk-doc intltool iptables
    modemmanager ppp=$_pppver rp-pppoe vala)
optdepends=('dhclient: DHCPv6 support'
    'dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'rp-pppoe: ADSL support'
    'modemmanager: cellular network support')
provides=(${pkgname%-*}=$pkgver libnm-glib=$pkgver)
conflicts=(${pkgname%-*} libnm-glib)
backup=(etc/NetworkManager/NetworkManager.conf)
options=(!emptydirs !libtool)
install=$pkgname.install
source=($pkgname::git://anongit.freedesktop.org/$_gitname/$_gitname
    git://git.gnome.org/libgsystem
    NetworkManager.conf
    disable_set_hostname.patch)
sha256sums=('SKIP'
            'SKIP'
            '759db295ddae7a6dc6b29211fc0ec08695f875584d456dd146d3679e2c33e2e3'
            '689e6702297a4cccfed660cb27d87accde86e89875b1f35f29ce0b6400baf1c4')
sha512sums=('SKIP'
            'SKIP'
            'e7bb02132503f8c5d021ac0354f156c7775c35ea6590eb48143e7ff61b1b0b6507c3d9679c69d2315eb0e15c8805d41c2f6cbef2370058b34fc8eefc0f471bc3'
            '587c1183a1dc94af4f6926a1de97e07422cb0d50f45b31a2405123df4629ad4412e7ada583c66c9d88f67e58f2559c3b80909960f1bd0a00d9adbcf5255b73af')

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
    patch -p1 -i ../disable_set_hostname.patch
    rm -rf libgsystem/
    ln -sf ../libgsystem
}

build() {
    cd $pkgname/
    NOCONFIGURE=1 ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/networkmanager \
        --with-crypto=nss \
        --with-distro=arch \
        --with-dhclient=/usr/bin/dhclient \
        --with-dhcpcd=/usr/bin/dhcpcd \
        --with-iptables=/usr/bin/iptables \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-udev-dir=/usr/lib/udev \
        --with-resolvconf=/usr/bin/resolvconf \
        --with-pppd=/usr/bin/pppd \
        --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
        --with-pppoe=/usr/bin/pppoe \
        --with-kernel-firmware-dir=/usr/lib/firmware \
        --with-session-tracking=systemd \
        --disable-static \
        --enable-more-warnings=no \
        --disable-wimax
    make
}

check() {
    make -kC $pkgname check
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install

    install -m644 $_gitname.conf "$pkgdir"/etc/$_gitname/
    install -m755 -d "$pkgdir"/etc/NetworkManager/dnsmasq.d

    rm -r "$pkgdir"/var/run
}
