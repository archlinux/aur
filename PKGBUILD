pkgname=networkmanager-openvpn-xor
pkgver=1.12.0
pkgrel=2
pkgdesc="NetworkManager VPN plugin for Standard and XOR Patched OpenVPN"
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
  intltool
)
optdepends=(
  "libnma-gtk4: GUI support (GTK 4)"
  "libnma: GUI support (GTK 3)"
)
conflicts=(
  "networkmanager-openvpn-git"
  "networkmanager-openvpn"
)
source=("git+https://github.com/maintuner/networkmanager-openvpn-xor")
b2sums=('SKIP')


prepare() {
  cd networkmanager-openvpn-xor
  
  git submodule update --init
  
  cd NetworkManager-openvpn
  
  for patch in ../patches/*.patch
  do
    patch -p1 < "$patch"
  done

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

  cd networkmanager-openvpn-xor/NetworkManager-openvpn
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd networkmanager-openvpn-xor/NetworkManager-openvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openvpn - "NetworkManager OpenVPN"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
