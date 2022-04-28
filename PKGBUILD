# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname=lib32-hwloc
pkgver=2.7.1
pkgrel=1
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures'
url='https://www.open-mpi.org/projects/hwloc/'
arch=('x86_64')
license=('BSD')
depends=("${pkgname#lib32-}" 'lib32-glibc' 'lib32-libpciaccess' 'lib32-libtool' 'lib32-systemd')
makedepends=('lib32-cairo' 'lib32-libx11' 'lib32-libxml2' 'lib32-pciutils')
optdepends=('lib32-cairo' 'lib32-libx11' 'lib32-libxml2' 'lib32-pciutils')
options=('!docs')
source=("https://download.open-mpi.org/release/hwloc/v${pkgver%.*}/${pkgname#lib32-}-${pkgver}.tar.bz2")
sha512sums=('35de85de3f5e75de30b5ac72d2c118dcb990a2427c9812910a03772857181fd7259a27352b34a968186d02ffc811644c3411d84ee37f2d0ff9b83628951b4863')
b2sums=('26706b8835954b8baa9028eaf2da0f8ae6e57d1841d68daaa04d58a7b24a67e4e171eb439b8dbfb589a70eb1b5cced51f12a99bb7132591919c902374f89025f')

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd hwloc-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --enable-plugins \
    --sysconfdir=/etc
  make
}

check() {
  cd hwloc-${pkgver}
  make check
}

package() {
  cd hwloc-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
