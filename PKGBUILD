# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>

_pkgname=htop
pkgname=htop-temperature
pkgver=3.0.2
pkgrel=2
pkgdesc='Interactive process viewer with added support for CPU temperature'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl' 'lm_sensors')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
install='htop.install'
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'htop-temperature.patch'
        'htop.install')
sha256sums=('b4744a3bea279f2a3725ed8e5e35ffd9cb10d66673bf07c8fe21feb3c4661305'
            '1d6e3e4fde8dc3d8f5e093b64c0eb8544f80cc2e0291d6558bdba158359d9f06'
            '2596ba7a4f8cd920d0cb93d7ac53f3ed052b322f6ea51e970833332319525a23')

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
