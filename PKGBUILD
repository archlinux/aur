# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-noscan
pkgname=networkmanager-noscan
provides=('networkmanager')
replaces=('networkmanager')
conflicts=('networkmanager')
pkgver=1.20.4
pkgrel=1
pkgdesc="Network connection manager and user applications"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL2 LGPL2.1)
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             iproute2 nss polkit wpa_supplicant curl systemd libmm-glib
             libnewt libndp libteam vala perl-yaml python-gobject git vala jansson bluez-libs
             glib2-docs dhcpcd iwd dnsmasq systemd-resolvconf libpsl audit meson)
checkdepends=(libx11 python-dbus)
_commit=27dee3b113bb45ffb53367f30a7c750eb146d980  # tags/1.20.4^0
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager
  git describe | sed 's/-dev/dev/;s/-rc/rc/;s/-/+/g'
}

prepare() {
  cd NetworkManager
  patch -Np1 -i ../../disable_wifi_scan_when_connected.patch
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

  arch-meson NetworkManager build "${meson_args[@]}"
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

package() {
  depends=(libnm iproute2 polkit wpa_supplicant libmm-glib libnewt libndp libteam curl
           bluez-libs libpsl audit)
  optdepends=('dnsmasq: connection sharing'
              'bluez: Bluetooth support'
              'ppp: dialup connection support'
              'modemmanager: cellular network support'
              'iwd: wpa_supplicant alternative')
  backup=(etc/NetworkManager/NetworkManager.conf)
  groups=(gnome)

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

### Split libnm
  _pick libnm "$pkgdir"/usr/include/libnm
  _pick libnm "$pkgdir"/usr/lib/girepository-1.0/NM-*
  _pick libnm "$pkgdir"/usr/lib/libnm.*
  _pick libnm "$pkgdir"/usr/lib/pkgconfig/libnm.pc
  _pick libnm "$pkgdir"/usr/share/gir-1.0/NM-*
  _pick libnm "$pkgdir"/usr/share/gtk-doc/html/libnm
  _pick libnm "$pkgdir"/usr/share/vala/vapi/libnm.*
}


# vim:set sw=2 et:
