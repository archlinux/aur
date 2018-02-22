# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>

pkgname=htop-temperature
pkgver=2.1.0
pkgrel=2
pkgdesc="Interactive process viewer with added support for CPU temperature"
arch=('i686' 'x86_64')
url="http://hisham.hm/htop/"
license=('GPL')
depends=('ncurses' 'libnl' 'lm_sensors')
makedepends=('python')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("http://hisham.hm/htop/releases/$pkgver/htop-$pkgver.tar.gz"
        "htop-temperature.patch")
sha256sums=('3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748'
            '68a96dc51a9cb847e40ad95ecf91a80979ca377f6b947e5cc9b2ef2c7dcb333e')

prepare() {
  cd "htop-$pkgver"

  # Add CPU temperature patch.
  patch -p1 -N < ../htop-temperature.patch
}

build() {
  cd "htop-$pkgver"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver


  make $MAKEFLAGS
}

package() {
  make -C "htop-$pkgver" DESTDIR="$pkgdir" install
}
