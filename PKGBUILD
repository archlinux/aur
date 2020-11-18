# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=htop
pkgname=htop-temperature-rpi
pkgver=3.0.2
pkgrel=2
pkgdesc='Interactive process viewer with added support for CPU temperature. Version for gathering Raspberry Pi CPU temperature from thermal_zone0'
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
        'htop-temperature-rpi.patch'
        'htop.install')
sha256sums=('b4744a3bea279f2a3725ed8e5e35ffd9cb10d66673bf07c8fe21feb3c4661305'
            '73f6945be919330a4819b213611fe20737ea541fcd86d16167338bd483874e24'
            'a79df5e2d7c4f61258baf223ab327c4f07762227f916fe0e06e4958d7b219f47')

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
