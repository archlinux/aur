# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Nathan <ndowens@artixlinux.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-iwd
pkgname=(networkmanager-iwd libnm-iwd nm-iwd-cloud-setup)
pkgver=1.42.0
pkgrel=1
pkgdesc="Network connection manager and user applications; using iwd backend instead of wpa_supplicant"
url="https://networkmanager.dev/"
arch=(x86_64)
license=(GPL)
_pppver=2.4.9
makedepends=(
  audit
  bluez-libs
  curl
  dhclient
  dnsmasq
  git
  glib2-docs
  gobject-introspection
  gtk-doc
  iproute2
  iwd
  jansson
  libmm-glib
  libndp
  libnewt
  libpsl
  libteam
  meson
  modemmanager
  nftables
  nss
  openresolv
  pacrunner
  perl-yaml
  polkit
  "ppp=$_pppver"
  python-gobject
  systemd
  vala
  vala
  wpa_supplicant
)
checkdepends=(
  libx11
  python-dbus
)
_commit=119ed52038f8b6e8cebb92314acf6e6bb5813fb0  # tags/1.42.0^0
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit"
        "$pkgbase.install")
sha256sums=('SKIP' '6f77a626ec3fd7583beb45ffcac236cdc1fe2b5e5b8ccc5d90983312a265e818')

pkgver() {
  cd NetworkManager
  git describe --tags | sed 's/-dev/dev/;s/-rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  local meson_options=(
    # system paths
    -D dbus_conf_dir=/usr/share/dbus-1/system.d

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D modify_system=true
    -D selinux=false

    # features
    -D iwd=true
    -D pppd_plugin_dir=/usr/lib/pppd/$_pppver
    -D teamdctl=true
    -D nm_cloud_setup=true
    -D bluez5_dun=true
    -D ebpf=true

    # configuration plugins
    -D config_plugins_default=keyfile
    -D ifcfg_rh=false
    -D ifupdown=false

    # handlers for resolv.conf
    -D netconfig=no
    -D config_dns_rc_manager_default=symlink

    # miscellaneous
    -D vapi=true
    -D docs=true
    -D more_asserts=no
    -D more_logging=false
    -D qt=false
  )

  arch-meson NetworkManager build "${meson_options[@]}"
  meson compile -C build
}

check() {
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
  depends=(
    audit
    bluez-libs
    curl
    iproute2
    iwd
    libmm-glib
    libndp
    libnewt
    libnm-iwd
    libpsl
    libteam
    mobile-broadband-provider-info
  )
  provides=(networkmanager)
  conflicts=(networkmanager)
  optdepends=(
    'bluez: Bluetooth support'
    'dnsmasq: connection sharing'
    'firewalld: firewall support'
    'iptables: connection sharing'
    'modemmanager: cellular network support'
    'nftables: connection sharing'
    'openresolv: alternative resolv.conf manager'
    'pacrunner: PAC proxy support'
    'polkit: let non-root users control networking'
    'ppp: dialup connection support'
  )
  backup=(etc/NetworkManager/NetworkManager.conf)
  install="$pkgbase.install"

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  # /etc/NetworkManager
  install -d etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 etc/NetworkManager/system-connections
  install -m644 /dev/stdin etc/NetworkManager/NetworkManager.conf <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
END

  # packaged configuration
  install -Dm644 /dev/stdin usr/lib/NetworkManager/conf.d/20-connectivity.conf <<END
[connectivity]
uri=http://ping.archlinux.org/nm-check.txt
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

  shopt -s globstar

  _pick libnm usr/include/libnm
  _pick libnm usr/lib/girepository-1.0/NM-*
  _pick libnm usr/lib/libnm.*
  _pick libnm usr/lib/pkgconfig/libnm.pc
  _pick libnm usr/share/gir-1.0/NM-*
  _pick libnm usr/share/gtk-doc/html/libnm
  _pick libnm usr/share/vala/vapi/libnm.*

  _pick cloud usr/lib/**/*nm-cloud-setup*
  _pick cloud usr/share/man/*/nm-cloud-setup*

  # Not actually packaged (https://bugs.archlinux.org/task/69138)
  _pick ovs usr/lib/systemd/system/NetworkManager.service.d/NetworkManager-ovs.conf

  # Restore empty dir
  install -d usr/lib/NetworkManager/dispatcher.d/no-wait.d
}

package_libnm-iwd() {
  pkgdesc="NetworkManager client library with iwd backend"
  license=(LGPL)
  depends=(
    glib2
    jansson
    nss
    systemd-libs
    util-linux-libs
  )
  provides=(libnm libnm.so)
  conflicts=(libnm)

  mv libnm/* "$pkgdir"
}

package_nm-iwd-cloud-setup() {
  pkgdesc="Automatically configure NetworkManager with iwd backend in cloud"
  depends=(networkmanager-iwd)
  provides=(nm-cloud-setup)
  conflicts=(nm-cloud-setup)

  mv cloud/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
