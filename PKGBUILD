# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname=lib32-hwloc
pkgver=2.6.0
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
sha512sums=('3f35ee685507469e2c7d4a2ab4c339eff24123b4bc21d96bc53fd2737a36bdd371f1e1e4440b410ecac6cf1881562187243bfbf846203cb3702a4c4c7be0d5df')
b2sums=('96099ae3527e11a83adc068e07756752d2effa38b4bae174045e5142a3457af8790e9fd3d778ff2d91708101aaf6e108affed7688918195e0f2bdbd55235ad46')

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
