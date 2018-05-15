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
pkgver=1.11.3.r20184.gc905ee94f
pkgrel=1
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL2 LGPL2.1)
depends=(dbus-glib libmm-glib libndp libnewt libnl libsoup libteam libutil-linux
    nss polkit wpa_supplicant)
checkdepends=(libx11 python-dbus)
_pppver=2.4.7
makedepends=(meson ninja intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             dbus-glib iproute2 nss polkit wpa_supplicant iwd libsoup systemd libgudev libmm-glib
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
	 NOCONFIGURE=1 $srcdir/$pkgname/autogen.sh
}

build() {
    cd $pkgname/
    arch-meson build \
    -Difcfg_rh=false \
    -Difcfg_suse=false \
    -Difnet=false \
    -Difupdown=false \
    -Dmore_warnings=false \
    -Dstatic=false \
    -Dbluez5_dun=true \
    -Dconcheck=true \
    -Dibft=true \
    -Ddocs=true \
    -Dintrospection=true \
    -Djson_validation=true \
    -Dld_gc=false \
    -Dmodify_system=true \
    -Dpolkit=yes \
    -Dpolkit_agent=true \
    -Dteamdctl=true \
	-Dovs=true \
    -Dwifi=true \
    -Dconfig_dhcp_default=internal \
    -Dconfig_dns_rc_manager_default=resolvconf \
    -Dconfig_logging_backend_default=journal \
    -Dconfig_plugins_default=keyfile,ibft \
    -Dcrypto=nss \
    -Ddbus_sys_dir=/usr/share/dbus-1/system.d \
    -Ddhclient=/usr/bin/dhclient \
    -Ddist_version="$pkgver, Arch Linux" \
    -Ddnsmasq=/usr/bin/dnsmasq \
    -Ddnssec_trigger=/usr/lib/dnssec-trigger \
    -Dhostname_persist=default \
    -Diptables=/usr/bin/iptables \
    -Dkernel_firmware_dir=/usr/lib/firmware \
    -Dlibnm_glib=true \
    -Dlibsoup=true \
    -Dmodem_manager=true \
    -Dnmcli=true \
    -Dnmtui=true \
    -Dpppd_plugin_dir=/usr/lib/pppd/$_pppver \
    -Dpppd=/usr/bin/pppd \
    -Dresolvconf=/usr/bin/resolvconf \
    -Dsession_tracking=systemd \
    -Dsuspend_resume=true \
    -Dsystem_ca_path=/etc/ssl/certs \
    -Dsystemd_journal=true \
    -Dsystemd_logind=true \
    -Dsystemdsystemunitdir=/usr/lib/systemd/system \
    -Dudev_dir=/usr/lib/udev \
    -Dwext=true \
    -Dconsolekit=false \
    -Dlibaudit=no \
    -Dnetconfig=false \
    -Dofono=false \
    -Dselinux=false \
    -Diwd=true

    ninja -C build

}

check() {
	cd $srcdir/$pkgname
    ninja -C build test
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
    DESTDIR="$pkgdir" ninja -C build install
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
