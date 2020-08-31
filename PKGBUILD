# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>

_pkgname=htop
pkgname=htop-temperature
pkgver=3.0.0
pkgrel=1
pkgdesc='Interactive process viewer with added support for CPU temperature'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '0001-Increae-the-size-of-sysfs-power-supply-path-buffers.patch'
        'htop-temperature.patch')
sha256sums=('1c0661f0ae5f4e2874da250b60cd515e4ac4c041583221adfe95f10e18d1a4e6'
            'e31d8ab3fc41048b9dce0016cbb8facb6d0e62cf4a91c295b99f268cf120f1fc'
            '9c2c536acfadf5be341fbf26422428e7b3b68a7516cf95008c0a85a8c388fe2f')

prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np1 < ../0001-Increae-the-size-of-sysfs-power-supply-path-buffers.patch

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
