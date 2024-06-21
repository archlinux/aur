# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.12.0
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://networkmanager.dev/docs/vpn/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libnm
  libsecret
  openvpn
)
makedepends=(
  git
  libnma
  libnma-gtk4
  python
)
optdepends=(
  "libnma-gtk4: GUI support (GTK 4)"
  "libnma: GUI support (GTK 3)"
)
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git?signed#tag=$pkgver")
b2sums=('45c3b6f6c240af1b7c368aa7c7d613cc2cb67216a3f6cbb3438d524095e9fa22d81fd8c51dd4541d62845feb239e3dcea5d0ba88b2047399f5138bfe20876cec')
validpgpkeys=(
  07F9AEC86144386D9576210B66A44781B4EBC2D0 # Íñigo Huguet <ihuguet@redhat.com>
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

package() {
  cd NetworkManager-openvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openvpn - "NetworkManager OpenVPN"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set sw=2 sts=-1 et:
