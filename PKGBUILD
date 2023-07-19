# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname=lib32-hwloc
pkgver=2.9.2
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
sha512sums=('ed38bd608eac81d3182243f0b63c6da070be918fdd8c876ca35fd63cccb4e25684b28bb045d033c53cd7b53451795d28e05e0bd876a5a0231de06c76ace11fef')
b2sums=('70737325888b87f90f95799490621e209864430813deff4731dbbbaa7be900d6d58fa874b3da5e851b553af00ba17e387762d3825bb9a592ffb311705b4a6833')

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
