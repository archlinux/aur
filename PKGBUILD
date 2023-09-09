# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=networkmanager-fortisslvpn
pkgver=1.4.0
pkgrel=3
pkgdesc="NetworkManager VPN plugin for Fortinet SSLVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
_pppver=2.5.0
depends=(
  libnm
  libsecret
  openfortivpn
  "ppp=$_pppver"
)
makedepends=(
  git
  libnma
  libnma-gtk4
  python
)
optdepends=(
  'libnma-gtk4: GUI support (GTK 4)'
  'libnma: GUI support (GTK 3)'
)
_commit=308987d45faee919e54547eb7ff0120c32c5a84e  # tags/1.4.0^0
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd NetworkManager-fortisslvpn
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd NetworkManager-fortisslvpn

  # ppp 2.5.0
  git cherry-pick -n 084ef529c5fb8169 8773f772d39f8eee d59819b5d26db44f

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
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver
  )

  cd NetworkManager-fortisslvpn
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-fortisslvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
}

# vim:set sw=2 sts=-1 et:
