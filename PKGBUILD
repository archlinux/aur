# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>

pkgname=htop-temperature
pkgver=2.0.2
pkgrel=1
pkgdesc="Interactive process viewer with added support for CPU temperature"
arch=('i686' 'x86_64')
url="http://hisham.hm/htop/"
license=('GPL')
depends=('ncurses' 'lm_sensors')
makedepends=('python')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("http://hisham.hm/htop/releases/$pkgver/htop-$pkgver.tar.gz"
        "htop-$pkgver-temperature.patch")
sha256sums=('179be9dccb80cee0c5e1a1f58c8f72ce7b2328ede30fb71dcdf336539be2f487'
            '68a96dc51a9cb847e40ad95ecf91a80979ca377f6b947e5cc9b2ef2c7dcb333e')

prepare() {
  cd "htop-$pkgver"

  # Add CPU temperature patch.
  patch -p1 -N < ../htop-$pkgver-temperature.patch
}

build() {
  cd "htop-$pkgver"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup

  make
}

package() {
  make -C "htop-$pkgver" DESTDIR="$pkgdir" install
}
