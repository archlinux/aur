# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=htop
pkgname=htop-temperature-rpi
pkgver=2.2.0
pkgrel=3
pkgdesc="Interactive process viewer with added support for CPU temperature. Version for gathering Raspberry Pi CPU temperature from vcgencmd"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://hisham.hm/htop/"
license=('GPL')
depends=('ncurses' 'libnl')
makedepends=('python')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!emptydirs')
source=("http://hisham.hm/$_pkgname/releases/$pkgver/$_pkgname-$pkgver.tar.gz"
        "htop-temperature-rpi.patch"
        "0001-fix-option-string.patch")
sha256sums=('d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57'
            '933e8b41668282ccfc0e3e82ca9559022360e803c8c42a2ddee223ba31198338'
            '343cfd8e01f2d47e54b38f725bb05a9825511b502acdb6803507e5fa4d52bed7')

prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np1 < "$srcdir"/0001-fix-option-string.patch

  # Add CPU temperature patch.
  patch -Np1 < "$srcdir"/htop-temperature-rpi.patch
}

build() {
  cd "$_pkgname-$pkgver"

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
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}
