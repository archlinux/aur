# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-iwd
pkgname=(networkmanager-iwd libnm-iwd)
pkgver=1.20.8
pkgrel=1
pkgdesc="NM modified package to use exclusively iwd backend getting rid of wpa_supplicant dependency"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL2 LGPL2.1)
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             iproute2 nss polkit wpa_supplicant curl systemd libmm-glib
             libnewt libndp libteam vala perl-yaml python-gobject git jansson bluez-libs
             glib2-docs dhcpcd iwd dnsmasq systemd-resolvconf libpsl audit meson)
checkdepends=(libx11 python-dbus)
_prefixver=1.20
source=("https://download.gnome.org/sources/NetworkManager/$_prefixver/NetworkManager-$pkgver.tar.xz")
sha256sums=("ad14e22a8dfcb76be795445e662f68a6604192da89b04aee66ab785e44b757c6")

#pkgver() {
#  cd NetworkManager-$pkgver
#  git describe | sed 's/-dev/dev/;s/-rc/rc/;s/-/+/g'
#}

prepare() {
  cd NetworkManager-$pkgver
}

build() {
  local meson_args=(
    -D dbus_conf_dir=/usr/share/dbus-1/system.d
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D modify_system=true
    -D polkit_agent=true
    -D selinux=false
    -D iwd=true
    -D pppd_plugin_dir=/usr/lib/pppd/$_pppver
    -D teamdctl=true
    -D bluez5_dun=true
    -D ebpf=true
    -D config_plugins_default=keyfile
    -D vapi=true
    -D docs=true
    -D more_asserts=no
    -D more_logging=false
    -D qt=false
  )

  arch-meson NetworkManager-$pkgver build "${meson_args[@]}"
  ninja -C build
}

check() {
  # iproute2 bug 
  # https://gitlab.freedesktop.org/NetworkManager/NetworkManager/commit/be76d8b624fab99cbd76092ff511e6adc305279c
  meson test -C build --print-errorlogs || :
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_networkmanager-iwd() {
  depends=(libnm-iwd iproute2 polkit iwd libmm-glib libnewt libndp libteam curl
           bluez-libs libpsl audit)
  provides=("networkmanager")
  conflicts=("networkmanager")
  optdepends=('dnsmasq: connection sharing'
              'bluez: Bluetooth support'
              'ppp: dialup connection support'
              'modemmanager: cellular network support')
              
  backup=(etc/NetworkManager/NetworkManager.conf)
  groups=(gnome)
  install="$pkgbase.install"
  DESTDIR="$pkgdir" meson install -C build

  # /etc/NetworkManager
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -m644 /dev/stdin "$pkgdir/etc/NetworkManager/NetworkManager.conf" <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
END

  # packaged configuration
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf" <<END
[connectivity]
uri=http://www.archlinux.org/check_network_status.txt
END

  # iwd wifi backend
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/NetworkManager/conf.d/30-wifi-backend.conf" <<END
[device]
wifi.backend=iwd
END

  # iwd.service overriding configuration
  install -Dm644 /dev/stdin "$pkgdir/etc/systemd/system/iwd.service.d/90-networkmanager.conf" <<END
[Unit]
After=systemd-udevd.service
Before=NetworkManager.service
END

### Split libnm
  _pick libnm "$pkgdir"/usr/include/libnm
  _pick libnm "$pkgdir"/usr/lib/girepository-1.0/NM-*
  _pick libnm "$pkgdir"/usr/lib/libnm.*
  _pick libnm "$pkgdir"/usr/lib/pkgconfig/libnm.pc
  _pick libnm "$pkgdir"/usr/share/gir-1.0/NM-*
  _pick libnm "$pkgdir"/usr/share/gtk-doc/html/libnm
  _pick libnm "$pkgdir"/usr/share/vala/vapi/libnm.*
}

package_libnm-iwd() {
  pkgdesc="NetworkManager client library with iwd backend"
  depends=(glib2 nss libutil-linux jansson systemd-libs)
  provides=("libnm")
  conflicts=("libnm")
  mv libnm/* "$pkgdir"
}
