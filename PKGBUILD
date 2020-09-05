# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>

_pkgname=htop
pkgname=htop-temperature
pkgver=3.0.1
pkgrel=2
pkgdesc='Interactive process viewer with added support for CPU temperature'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'htop-temperature.patch')
sha256sums=('8465164bc085f5f1813e1d3f6c4b9b56bf4c95cc12226a5367e65794949b01ca'
            '6e8e63b1f31b62ba6da78955fce239ab748fc9f3020d5b3da3c385184008cb31')

prepare() {
  cd "$_pkgname-$pkgver"

  # Add CPU temperature patch.
  patch -Np1 < ../htop-temperature.patch

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
