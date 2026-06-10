# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# (Added from network-manager package)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-git
_gitname=NetworkManager
pkgname=(networkmanager-git libnm-git nm-cloud-setup-git)
_pppver=2.4.9
pkgver=1.57.4dev+r13+g87a7700460
pkgrel=1
pkgdesc="Network Management daemon and user application"
arch=(x86_64)
url=https://networkmanager.dev/
license=(GPL-2.0-or-later LGPL-2.1-or-later)
checkdepends=(libx11 python-dbus)
makedepends=(dnsmasq mobile-broadband-provider-info meson ninja intltool dhclient openresolv iptables gobject-introspection gtk-doc ppp modemmanager
              iproute2 nss polkit wpa_supplicant systemd libgudev audit curl
             libnewt libndp libteam vala perl-yaml python-gobject git jansson bluez-libs
             glib2-docs nftables pacrunner glib2-devel)
source=(git+https://github.com/$_gitname/$_gitname
    NetworkManager.conf
    20-connectivity.conf)
sha256sums=('SKIP'
            '794915f947bb2eeb46301acff82a350aa691c187d4c43f07a13d971298b64928'
            '983b35fc1846785932135c4fcda467a5d790b86bc50599ebafa8fe064ba53489')
sha512sums=('SKIP'
            '60f3cd070ec52c8937ee2701a8397766da0a9318d98d89c2a287e6f50ca3a3c7ea07a7debe26f5ad637bb4f24391d4107669d7581d934cbc3e4a09d7d775d4af'
            '54c55789cb1e4a52ee7dbdcf75b3a8a4712624a4db249014b64c07c090fbdfd2b907ecd8357d8e1ca9dd72f4a366009213c6102ba68e6f7a3503caced15a638d')

pkgver() {
  cd NetworkManager/
  git describe --tags | sed 's/-dev/dev/;s/-rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
    local meson_args=(
        -D more_logging=false \
        -D more_asserts=no \
        -D bluez5_dun=false \
        -D ebpf=true \
        -D docs=true \
        -D introspection=true \
        -D ld_gc=true \
        -D polkit=true \
        -D teamdctl=true \
        -D wifi=true \
        -D libaudit=yes \
        -D config_dhcp_default=internal \
        -D config_dns_rc_manager_default=symlink \
        -D config_logging_backend_default=journal \
        -D config_plugins_default=keyfile,ibft \
        -D crypto=nss \
        -D dbus_conf_dir=/usr/share/dbus-1/system.d \
        -D dhclient=/usr/bin/dhclient \
        -D dhcpcd=/usr/bin/dhcpcd \
        -D dnsmasq=/usr/bin/dnsmasq \
        -D hostname_persist=default \
        -D iptables=/usr/bin/iptables \
        -D ip6tables=/usr/bin/ip6tables \
        -D kernel_firmware_dir=/usr/lib/firmware \
        -D modem_manager=true \
        -D pppd_plugin_dir=/usr/lib/pppd/$_pppver \
        -D pppd=/usr/bin/pppd \
        -D resolvconf=/usr/bin/resolvconf \
        -D session_tracking=systemd \
        -D session_tracking_consolekit=false \
        -D suspend_resume=systemd \
        -D system_ca_path=/etc/ssl/certs \
        -D systemd_journal=true \
        -D systemdsystemunitdir=/usr/lib/systemd/system \
        -D udev_dir=/usr/lib/udev \
        -D iwd=true \
        -D selinux=false \
        -D qt=false \
        -D nbft=false \
        -D clat=false \
        -D ifcfg_rh=false \
        -D ifupdown=false \
        -D netconfig=no \
        -D vapi=true
      )
      arch-meson NetworkManager build "${meson_args[@]}"
      meson compile -C build
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
   depends=(iproute2 mobile-broadband-provider-info polkit wpa_supplicant openresolv libnewt libndp libteam curl bluez-libs libpsl audit libnm-git jansson readline libmm-glib)
    optdepends=(
    'dnsmasq: connection sharing'
    'dhcpcd: alternative DHCP client'
    'bluez: Bluetooth support'
    'ppp: dialup connection support'
    'dhclient: External DHCP client'
    'modemmanager: cellular network support'
    'firewalld: firewall support'
    'iwd: wpa_supplicant alternative'
    'nftables: connection sharing'
    'pacrunner: PAC proxy support'
)
    backup=('etc/NetworkManager/NetworkManager.conf')
    conflicts=('networkmanager')
    provides=('networkmanager')

    DESTDIR="$pkgdir" meson install -C build

  install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -m644 $srcdir/NetworkManager.conf "$pkgdir/etc/NetworkManager/"
  install -Dm644 $srcdir/20-connectivity.conf \
    "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf"

  shopt -s globstar
  _pick libnm "$pkgdir"/usr/include/libnm
  _pick libnm "$pkgdir"/usr/lib/girepository-1.0/NM-*
  _pick libnm "$pkgdir"/usr/lib/libnm.*
  _pick libnm "$pkgdir"/usr/lib/pkgconfig/libnm.pc
  _pick libnm "$pkgdir"/usr/share/gir-1.0/NM-*
  _pick libnm "$pkgdir"/usr/share/gtk-doc/html/libnm
  _pick libnm "$pkgdir"/usr/share/vala/vapi/libnm.*

  _pick cloud "$pkgdir"/usr/lib/**/*nm-cloud-setup*
  _pick cloud "$pkgdir"/usr/share/man/**/nm-cloud-setup*

  # OVS service override not packaged (https://bugs.archlinux.org/task/69138)
  _pick ovs "$pkgdir"/usr/lib/systemd/system/NetworkManager.service.d/NetworkManager-ovs.conf

  # Restore empty dir
  install -d usr/lib/NetworkManager/dispatcher.d/no-wait.d


}

package_libnm-git() {
  pkgdesc="NetworkManager client library"
  provides=(libnm)
  conflicts=(libnm)
  depends=(glib2 nss util-linux-libs systemd-libs)
  cd "$srcdir"
  mv libnm/* "$pkgdir"
}

package_nm-cloud-setup-git() {
  pkgdesc="Automatically configure NetworkManager in cloud"
  depends=(networkmanager-git)
  conflicts=(nm-cloud-setup)

  cd "$srcdir"
  mv cloud/* "$pkgdir"
}

