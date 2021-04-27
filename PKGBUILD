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
pkgname=(networkmanager-git libnm-git)
pkgver=1.31.2.r28078.gaf360238be
pkgrel=1
pkgdesc="Network Management daemon"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL2 LGPL2.1)
depends=(dbus-glib libmm-glib libndp libnewt libnl libsoup libteam libutil-linux
    nss polkit wpa_supplicant)
checkdepends=(libx11 python-dbus)
_pppver=2.4.8
makedepends=(dnsmasq mobile-broadband-provider-info  meson ninja intltool dhclient openresolv iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
              iproute2 nss polkit wpa_supplicant libsoup systemd libgudev
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
source=(git://github.com/$_gitname/$_gitname
    NetworkManager.conf
    20-connectivity.conf)
sha256sums=('SKIP'
            '794915f947bb2eeb46301acff82a350aa691c187d4c43f07a13d971298b64928'
            '477d609aefd991c48aca93dc7ea5a77ebebf46e0481184530cceda4c0d8d72c6')
sha512sums=('SKIP'
            '60f3cd070ec52c8937ee2701a8397766da0a9318d98d89c2a287e6f50ca3a3c7ea07a7debe26f5ad637bb4f24391d4107669d7581d934cbc3e4a09d7d775d4af'
            'da52ba9603c279c1c865cc3bf63606e1daeeb2a22c68e4b0077e15c312e251b494c4f0c94bcb27c9f6923f8b69cd7ab9062d9b7ce499222d3d2240864ed9345f')

pkgver() {
    cd NetworkManager/
    local ver=$({ echo 'changequote([,])dnl';
     sed -rn 's/^m4_(define.*nm_.*_version.*)/\1dnl/p' configure.ac;
      echo 'nm_major_version.nm_minor_version.nm_micro_version';
                echo 'define(AC_INIT,$2)dnl'
                grep '^AC_INIT(.*)' configure.ac; } | m4)
  local rev=$(git rev-list --count HEAD)
  local git=$(git rev-parse --short HEAD)
  echo "$ver.r$rev.g$git"
}

build() {
    local meson_args=(
        -D more_logging=false \
        -D more_warnings=false \
        -D more_asserts=no \
        -D bluez5_dun=false \
        -D ebpf=true \
        -D ibft=true \
        -D docs=true \
        -D introspection=true \
        -D json_validation=true \
        -D ld_gc=true \
        -D modify_system=true \
        -D polkit=true \
        -D polkit_agent=true \
        -D teamdctl=true \
        -D wifi=true \
        -D config_dhcp_default=internal \
        -D config_dns_rc_manager_default=symlink \
        -D config_logging_backend_default=journal \
        -D config_plugins_default=keyfile,ibft \
        -D crypto=nss \
        -D dbus_conf_dir=/usr/share/dbus-1/system.d \
        -D dhclient=/usr/bin/dhclient \
        -D dhcpcd=/usr/bin/dhcpcd \
        -D dnsmasq=/usr/bin/dnsmasq \
        -D dnssec_trigger=/usr/lib/dnssec-trigger/dnssec-trigger-script \
        -D hostname_persist=default \
        -D iptables=/usr/bin/iptables \
        -D kernel_firmware_dir=/usr/lib/firmware \
        -D modem_manager=true \
        -D pppd_plugin_dir=/usr/lib/pppd/$_pppver \
        -D pppd=/usr/bin/pppd \
        -D resolvconf=/usr/bin/resolvconf \
        -D session_tracking=systemd \
        -D suspend_resume=systemd \
        -D system_ca_path=/etc/ssl/certs \
        -D systemd_journal=true \
        -D systemdsystemunitdir=/usr/lib/systemd/system \
        -D udev_dir=/usr/lib/udev \
        -D iwd=true \
        -D selinux=false \
        -D qt=false
      )
      arch-meson NetworkManager build "${meson_args[@]}"
}

#check() {
#  meson test -C build --print-errorlogs
#}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_networkmanager-git() {
   depends=(iproute2 mobile-broadband-provider-info polkit wpa_supplicant libsoup openresolv libnewt libndp libteam curl bluez-libs libpsl audit)
    optdepends=('dnsmasq: connection sharing'
    'bluez: Bluetooth support'
    'openresolv: resolvconf support'
    'ppp: dialup connection support'
    'dhclient: External DHCP client'
    'modemmanager: cellular network support')
    backup=('etc/NetworkManager/NetworkManager.conf')
    conflicts=('networkmanager')
    provides=('networkmanager')

    DESTDIR="$pkgdir" meson install -C build

  install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -m644 $srcdir/NetworkManager.conf "$pkgdir/etc/NetworkManager/"
  install -Dm644 $srcdir/20-connectivity.conf \
    "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf"

  _pick libnm "$pkgdir"/usr/include/libnm
  _pick libnm "$pkgdir"/usr/lib/girepository-1.0/NM-*
  _pick libnm "$pkgdir"/usr/lib/libnm.* 
  _pick libnm "$pkgdir"/usr/lib/pkgconfig/libnm.pc 
  _pick libnm "$pkgdir"/usr/share/gir-1.0/NM-*
  _pick libnm "$pkgdir"/usr/share/gtk-doc/html/libnm
  _pick libnm "$pkgdir"/usr/share/vala/vapi/libnm.*

}

  package_libnm-git() {
  pkgdesc="NetworkManager client library"
  provides=(libnm)
  conflicts=(libnm)
  depends=(glib2 libgudev nss libutil-linux jansson systemd-libs)
  mv libnm/* "$pkgdir"
}

