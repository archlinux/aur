# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=htop
pkgname=htop-temperature-rpi
pkgver=3.0.1
pkgrel=1
pkgdesc='Interactive process viewer with added support for CPU temperature. Version for gathering Raspberry Pi CPU temperature from thermal_zone0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'htop-temperature-rpi.patch')
sha256sums=('8465164bc085f5f1813e1d3f6c4b9b56bf4c95cc12226a5367e65794949b01ca'
            'a8e2c2bf3f96c8d75d1e309c8056553b53c8dd23b5d1585cf63ff6166a91f4f6')

prepare() {
  cd "$_pkgname-$pkgver"

  # Add CPU temperature patch.
  patch -Np1 < ../htop-temperature-rpi.patch

  autoreconf -fi
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}
