# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=perfsuite
pkgver=1.1.4
pkgrel=1
pkgdesc="Collection of tools, utilities, and libraries for software performance analysis"
arch=('i686' 'x86_64')
url='http://perfsuite.ncsa.illinois.edu/'
license=('custom')
depends=('binutils'
         'tdom' 'papi' 'tk'
         'java-environment' 'openmpi')
source=("${url}/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fce97cff12e725814ddc1b1ac488e8085c4548d352d9ea8de269ed20820aaf07')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Out of source build
  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  _binutils_ver=$(pacman -Qi binutils | grep Version | cut --characters=18-21)

  ../configure --prefix=/usr \
    --with-libbfd=bfd-${_binutils_ver}.0 \
    --enable-java \
    --with-mpi \
    --with-papi=/usr \
    --with-tdom=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make -j1 install DESTDIR="${pkgdir}"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix owner of the javadoc files
  chown -R root:root "${pkgdir}/usr/share/${pkgname}/doc/javadoc"
}

# vim:set ts=2 sw=2 et:
