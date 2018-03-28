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
pkgname=(networkmanager-git libnm-glib-git libnm-git)
pkgver=1.11.2.r19808.ga18758522
pkgrel=1
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL2 LGPL2.1)
depends=(dbus-glib libmm-glib libndp libnewt libnl libsoup libteam libutil-linux
    nss polkit wpa_supplicant)
checkdepends=(libx11 python-dbus)
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             dbus-glib iproute2 nss polkit wpa_supplicant libsoup systemd libgudev libmm-glib
             libnewt libndp libteam vala perl-yaml python-gobject git vala jansson bluez-libs
             glib2-docs)
optdepends=( 'iwd: alternative way to connect to wifi'
'dhclient: DHCPv6 support'
    'dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'rp-pppoe: ADSL support'
    'modemmanager: cellular network support')
options=(!libtool !emptydirs)
source=($pkgname::git://github.com/$_gitname/$_gitname
    NetworkManager.conf
    20-connectivity.conf)
sha256sums=('SKIP'
            '759db295ddae7a6dc6b29211fc0ec08695f875584d456dd146d3679e2c33e2e3'
            '477d609aefd991c48aca93dc7ea5a77ebebf46e0481184530cceda4c0d8d72c6')
sha512sums=('SKIP'
            'e7bb02132503f8c5d021ac0354f156c7775c35ea6590eb48143e7ff61b1b0b6507c3d9679c69d2315eb0e15c8805d41c2f6cbef2370058b34fc8eefc0f471bc3'
            'da52ba9603c279c1c865cc3bf63606e1daeeb2a22c68e4b0077e15c312e251b494c4f0c94bcb27c9f6923f8b69cd7ab9062d9b7ce499222d3d2240864ed9345f')

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
     mkdir -p libnm{,-glib}/usr/{include,lib/{girepository-1.0,pkgconfig},share/{gir-1.0,gtk-doc/html,vala/vapi}}
    cd $pkgname/
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $pkgname/
    ./configure \
    --sysconfdir=/etc \
    --prefix=/usr \
    --localstatedir=/var \
    runstatedir=/run \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-ifcfg-rh \
    --disable-ifcfg-suse \
    --disable-ifnet \
    --disable-ifupdown \
    --disable-lto \
    --disable-more-warnings \
    --disable-static \
    --enable-bluez5-dun \
    --enable-concheck \
    --enable-config-plugin-ibft \
    --enable-gtk-doc \
    --enable-introspection \
    --enable-json-validation \
    --enable-ld-gc \
    --enable-modify-system \
    --enable-polkit \
    --enable-polkit-agent \
    --enable-teamdctl \
    --enable-wifi \
    --with-config-dhcp-default=internal \
    --with-config-dns-rc-manager-default=resolvconf \
    --with-config-logging-backend-default=journal \
    --with-config-plugins-default=keyfile,ibft \
    --with-crypto=nss \
    --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
    --with-dhclient=/usr/bin/dhclient \
    --with-dist-version="$pkgver, Arch Linux" \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-dnssec-trigger=/usr/lib/dnssec-trigger \
    --with-hostname-persist=default \
    --with-iptables=/usr/bin/iptables \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-libnm-glib \
    --with-libsoup \
    --with-modem-manager-1 \
    --with-nmcli \
    --with-nmtui \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-pppd=/usr/bin/pppd \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-session-tracking=systemd \
    --with-suspend-resume=systemd \
    --with-system-ca-path=/etc/ssl/certs \
    --with-systemd-journal \
    --with-systemd-logind \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-wext \
    --without-consolekit \
    --without-dhcpcd \
    --without-libaudit \
    --without-netconfig \
    --without-ofono \
    --without-selinux \
    --with-iwd=yes

     sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

    make

}

check() {
    make -kC $pkgname check
}

package_networkmanager-git() {
   depends=(libnm-glib iproute2 polkit wpa_supplicant libsoup libmm-glib libnewt libndp libteam
           bluez-libs)
    optdepends=('dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'dhclient: External DHCP client'
    'modemmanager: cellular network support')
    backup=('etc/NetworkManager/NetworkManager.conf')
    conflicts=('networkmanager')
    provides=('networkmanager')
    cd $srcdir/$pkgname
    make -C $srcdir/$pkgname DESTDIR="$pkgdir" install
            install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"
  install -Dm644 ../20-connectivity.conf \
    "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf"
### Split libnm

  cd ../libnm
  mv "$pkgdir"/usr/include/libnm usr/include
  mv "$pkgdir"/usr/lib/girepository-1.0/NM-* usr/lib/girepository-1.0
  mv "$pkgdir"/usr/lib/libnm.* usr/lib
  mv "$pkgdir"/usr/lib/pkgconfig/libnm.pc usr/lib/pkgconfig
  mv "$pkgdir"/usr/share/gir-1.0/NM-* usr/share/gir-1.0
  mv "$pkgdir"/usr/share/gtk-doc/html/libnm usr/share/gtk-doc/html
  mv "$pkgdir"/usr/share/vala/vapi/libnm.* usr/share/vala/vapi

### Split libnm-glib

  cd ../libnm-glib
  mv "$pkgdir"/usr/include/* usr/include
  mv "$pkgdir"/usr/lib/girepository-1.0/* usr/lib/girepository-1.0
  mv "$pkgdir"/usr/lib/libnm-* usr/lib
  mv "$pkgdir"/usr/lib/pkgconfig/* usr/lib/pkgconfig
  mv "$pkgdir"/usr/share/gir-1.0/* usr/share/gir-1.0
  mv "$pkgdir"/usr/share/gtk-doc/html/libnm-* usr/share/gtk-doc/html
  mv "$pkgdir"/usr/share/vala/vapi/* usr/share/vala/vapi

  rmdir -p --ignore-fail-on-non-empty \
    "$pkgdir"/usr/include \
    "$pkgdir"/usr/lib/{girepository-1.0,pkgconfig} \
    "$pkgdir"/usr/share/{gir-1.0,vala/vapi}
       
}

  package_libnm-git() {
  pkgdesc="NetworkManager client library"
  provides=(libnm)
  conflicts=(libnm)
  depends=(glib2 libgudev nss libutil-linux jansson)
  mv libnm/* "$pkgdir"
}

   package_libnm-glib-git() {
     pkgdesc="NetworkManager client library (legacy)"
       depends=(libgudev nss dbus-glib libutil-linux jansson)
       conflicts=('libnm-glib')
       provides=('libnm-glib')
    mv libnm-glib/* "$pkgdir"
 }
