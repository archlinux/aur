# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=networkmanager-fortisslvpn-peerdns
pkgver=1.4rc1
pkgrel=1
pkgdesc='Fortinet SSLVPN support for NetworkManager'
arch=(x86_64)
license=(GPL)
url='https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn'
depends=(networkmanager nm-connection-editor openfortivpn libsecret)
makedepends=(git intltool python)
provides=('networkmanager-fortisslvpn')
conflicts=('networkmanager-fortisslvpn')
_commit=9688d63ecacec97d0c9217281eb7b85053f1f4a1
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn.git#commit=$_commit"
        "NetworkManager-fortisslvpn-openvpn-1_11.patch")
sha256sums=('SKIP'
            'e423086caf5f07d6b62ca0d52b2138ae2c0c102bd8b8501eb1aa11f997949d51')

prepare() {
  cd NetworkManager-fortisslvpn
  
  # https://bugs.archlinux.org/task/65644
  patch -p1 < ../NetworkManager-fortisslvpn-openvpn-1_11.patch
  
  autoreconf -fi
}

build() {
  cd NetworkManager-fortisslvpn
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --disable-static
  make
}

package() {
  cd NetworkManager-fortisslvpn
  make DESTDIR="$pkgdir" install
}
