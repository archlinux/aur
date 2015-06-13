# Maintainer: Blair Bonnett <blair.bonnett at gmail dot com>

pkgname=htop-temperature
pkgver=1.0.3
pkgrel=1
pkgdesc="Interactive process viewer with added support for CPU temperature"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'lm_sensors')
makedepends=('python2')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz"
        "htop-1.0.3-temperature.patch")
sha256sums=('055c57927f75847fdc222b5258b079a9542811a9dcf5421c615c7e17f55d1829'
            '6b52b5b5c0cce04ab71d8603409927dffb77433526b08a35087eb028bab0a5cf')

prepare() {
  # Standard htop package commands.
  cd "htop-1.0.3"
  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py

  # Add CPU temperature patch.
  patch -p1 -N < ../htop-1.0.3-temperature.patch
}

build() {
  cd "htop-1.0.3"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup \
      --enable-oom

  make
}

package() {
  make -C "htop-1.0.3" DESTDIR="$pkgdir" install
}
