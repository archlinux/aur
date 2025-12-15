# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager-iwd
pkgname=(
  networkmanager-iwd
  libnm-iwd
  nm-iwd-cloud-setup
)
pkgver=1.54.3
pkgrel=1
pkgdesc="Network connection manager and user applications; using iwd backend instead of wpa_supplicant"
url="https://networkmanager.dev/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
makedepends=(
  audit
  bash
  curl
  dnsmasq
  gcc-libs
  git
  glib2-devel
  glibc
  gobject-introspection
  gtk-doc
  iproute2
  iwd
  jansson
  libmm-glib
  libndp
  libnewt
  libnvme
  libpsl
  libteam
  meson
  modemmanager
  nftables
  nspr
  nss
  openresolv
  pacrunner
  perl-yaml
  polkit
  ppp
  python-gobject
  readline
  systemd
  systemd-libs
  vala
  vala
  wpa_supplicant
)
checkdepends=(
  libx11
  python-dbus
)
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#tag=${pkgver/[a-z]/-&}"
        "$pkgbase.install")
b2sums=('5da0800e5ea38f8eda955bf854c778b93e3a17b80da8602b48e017e66e74392caf9458701f6b7a4b9de85108d30ecd89d5491bd26123925228b6788d3b6aae32'
        '1045d7a75487dd063e2d52f2c94944c04650b9337d4cb839b66dc692f477797406ed2164725a53a1c213c46dd7ea398ca9764ee09386766554aa179d8c320cd2')

build() {
  local meson_options=(
    # build checks this option; injecting just via *FLAGS is broken
    -D b_lto=true

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D modify_system=true
    -D selinux=false

    # features
    -D iwd=true
    -D teamdctl=true

    # configuration plugins
    -D config_plugins_default=keyfile
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
  NMTST_FORCE_REAL_ROOT=1 meson test -C build --print-errorlogs
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
    curl
    gcc-libs
    glib2
    glibc
    iproute2
    jansson
    iwd
    libmm-glib
    libndp
    libnewt
    libnm-iwd
    libpsl
    libteam
    mobile-broadband-provider-info
    nspr
    nss
    readline
    systemd-libs
  )
  provides=(networkmanager)
  conflicts=(networkmanager)
  optdepends=(
    'bluez: Bluetooth support'
    'dnsmasq: connection sharing'
    'firewalld: firewall support'
    'iptables: connection sharing'
    'libnvme: NBFT support'
    'modemmanager: cellular network support'
    'nftables: connection sharing'
    'openresolv: alternative resolv.conf manager'
    'pacrunner: PAC proxy support'
    'polkit: let non-root users control networking'
    'ppp: dialup connection support'
  )
  backup=(etc/NetworkManager/NetworkManager.conf)

  # NM wants to move to LGPL only, but there's still GPL code left
  license+=(GPL-2.0-or-later)

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

  _pick docs usr/share/gtk-doc

  _pick libnm usr/include/libnm
  _pick libnm usr/lib/girepository-1.0/NM-*
  _pick libnm usr/lib/libnm.*
  _pick libnm usr/lib/nm-libnm-helper
  _pick libnm usr/lib/pkgconfig/libnm.pc
  _pick libnm usr/share/gir-1.0/NM-*
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
  depends=(
    gcc-libs
    glib2
    glibc
    nspr
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
  depends=(
    bash
    curl
    gcc-libs
    glib2
    glibc
    libnm
    networkmanager-iwd
  )
  provides=(nm-cloud-setup)
  conflicts=(nm-cloud-setup)

  mv cloud/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
