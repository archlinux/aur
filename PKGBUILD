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
pkgver=1.56.1
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
  git
  glib2
  glib2-devel
  glibc
  gobject-introspection
  gtk-doc
  iproute2
  iwd
  jansson
  libgcc
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
)
checkdepends=(
  libx11
  python-dbus
)
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#tag=${pkgver/[a-z]/-&}"
        "$pkgbase.install")
b2sums=('fbd3fd7ca98b75cddc61c85e888f10f103dfed2405e9798a6bfc988788312b47b3b5f011664db303939c75ca404e258a23b8515a308cbf77ecfc29188524e20e'
        '1045d7a75487dd063e2d52f2c94944c04650b9337d4cb839b66dc692f477797406ed2164725a53a1c213c46dd7ea398ca9764ee09386766554aa179d8c320cd2')

build() {
  local meson_options=(
    # build checks this option; injecting just via *FLAGS is broken
    -D b_lto=true

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D polkit_noauth_group=wheel
    -D selinux=false

    # features
    -D config_wifi_backend_default=iwd
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
    glib2
    glibc
    iproute2
    jansson
    libgcc
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
    glib2
    glibc
    libgcc
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
    glib2
    glibc
    jansson
    libgcc
    libnm
    networkmanager-iwd
  )
  provides=(nm-cloud-setup)
  conflicts=(nm-cloud-setup)

  mv cloud/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
