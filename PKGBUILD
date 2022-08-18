# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname=lib32-hwloc
pkgver=2.8.0
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
sha512sums=('025c8ebc2945bdf696cc66fe2cfea0195694713a6098603fb4eaeac409d2f6c3386a7c2b4d7f3758d828f6b621e7f06ffb5745224cb1df2f8ff4f19b2a8a4a7b')
b2sums=('33f75987ee904d5ee9c62268695a2f7f59b0adc2e1601fc4407f525664b78a7fab04c75823ce9d190c8cb9ffc0ce983d7137555625d47bc1451a2d0c6f330055')

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
