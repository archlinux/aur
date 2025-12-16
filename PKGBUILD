# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=networkmanager-openvpn
pkgname=(
  networkmanager-openvpn
  networkmanager-vpn-plugin-openvpn
)
pkgver=1.12.4
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://networkmanager.dev/docs/vpn/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  gtk4
  libnm
  libnma-gtk4
  libsecret
)
makedepends=(
  git
  libnma
  openvpn
  python
)
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git?signed#tag=$pkgver")
b2sums=('4b53b27c36accdc0f49777279c6e62f81028b0bbc658bedcc2b67fb548871b2ebaa62e468a7a3f21e0d308107940f335fcd0e2690ef336f224e49c4cda59f689')
validpgpkeys=(
  07F9AEC86144386D9576210B66A44781B4EBC2D0 # Íñigo Huguet <ihuguet@redhat.com>
  1CFF865BDF957BE935765BBD2E1878D078DEF7C6 # Íñigo Huguet <ihuguet@riseup.net>
)

prepare() {
  cd NetworkManager-openvpn
  autoreconf -fvi
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --disable-static
    --with-gtk4
  )

  cd NetworkManager-openvpn
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
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

package_networkmanager-openvpn() {
  pkgdesc+=" (with GUI)"
  depends+=(
    "networkmanager-vpn-plugin-openvpn=$pkgver-$pkgrel"
  )
  optdepends=(
    "libnma: GUI support (GTK 3)"
  )

  cd NetworkManager-openvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d

  cd "$pkgdir"
  _pick plugin usr/lib/NetworkManager/VPN
  _pick plugin usr/lib/NetworkManager/libnm-vpn-plugin-openvpn.so
  _pick plugin usr/lib/nm-openvpn-service*
  _pick plugin usr/lib/sysusers.d
  _pick plugin usr/lib/tmpfiles.d
  _pick plugin usr/share/dbus-1
}

package_networkmanager-vpn-plugin-openvpn() {
  pkgdesc+=" (VPN plugin only)"
  depends=(
    gcc-libs
    glib2
    glibc
    libnm
    openvpn
  )

  mv plugin/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
