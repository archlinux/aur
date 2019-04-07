# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=htop
pkgname=htop-temperature-rpi
pkgver=2.2.0
pkgrel=5
pkgdesc="Interactive process viewer with added support for CPU temperature. Version for gathering Raspberry Pi CPU temperature from thermal_zone0"
arch=('armv6h' 'armv7h' 'aarch64')
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
            '543ac03c0d8c33659dc06b18a5341ced4071a4f49e6e7430ba2c3e0112de0ef6'
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
