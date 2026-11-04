# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Evann DREUMONT (LeGmask) <archlinux@evann.dev>

pkgbase=networkmanager-openvpn-pkcs11
pkgname=(
  networkmanager-openvpn-pkcs11
  networkmanager-vpn-plugin-openvpn-pkcs11
)
pkgver=1.12.5
pkgrel=2
pkgdesc="NetworkManager VPN plugin for OpenVPN, with PKCS#11 support"
url="https://networkmanager.dev/docs/vpn/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  glib2
  glibc
  gtk4
  libgcc
  libnm
  libnma-gtk4
  libsecret
  p11-kit
  pkcs11-helper
)
makedepends=(
  git
  libnma
  openvpn
  p11-kit
  pkcs11-helper
  python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git#tag=$pkgver"
  "Add-PKCS11-support.patch"
)
b2sums=(
  'edbce314b1893816a02a4def83b0d28435518d96baff0940e20dd2124b7ed64833777c7ac145166cc56ff4d6a592624b9b1d25b470d79068e94a320849a6173c'
  'SKIP'
)
validpgpkeys=(
  07F9AEC86144386D9576210B66A44781B4EBC2D0 # Íñigo Huguet <ihuguet@redhat.com>
  1CFF865BDF957BE935765BBD2E1878D078DEF7C6 # Íñigo Huguet <ihuguet@riseup.net>
)

prepare() {
  cd NetworkManager-openvpn
  patch -Np1 -i ../Add-PKCS11-support.patch
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

package_networkmanager-openvpn-pkcs11() {
  pkgdesc+=" (with GUI)"
  depends+=(
    "networkmanager-vpn-plugin-openvpn-pkcs11=$pkgver-$pkgrel"
  )
  optdepends=(
    "libnma: GUI support (GTK 3)"
  )
  provides=("networkmanager-openvpn=$pkgver")
  conflicts=(networkmanager-openvpn)

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

package_networkmanager-vpn-plugin-openvpn-pkcs11() {
  pkgdesc+=" (VPN plugin only)"
  depends=(
    glib2
    glibc
    libgcc
    libnm
    openvpn
  )
  provides=("networkmanager-vpn-plugin-openvpn=$pkgver")
  conflicts=(networkmanager-vpn-plugin-openvpn)

  mv plugin/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
