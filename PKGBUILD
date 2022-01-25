# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname=lib32-hwloc
pkgver=2.7.0
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
sha512sums=('9f3a9d66ad9762ca88f9e38950a7c1beb208337517b635c4c363dcfbb050706562511cb12115bd403c0a86c0f7270174dd1888e7803d88557e41ae018e7e7e2f')
b2sums=('b101451b1f7b0f4c86a4d009637d40430eca3f127c9a69f3bc95bf91ad7051e158b1310cec5aeddef000cbf461f648c2fd560b5c011e0b4b4a49848188e2ff5c')

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
