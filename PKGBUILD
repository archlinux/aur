# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Joost Bremmer <toost dot b at gmail dot com>

pkgname=libtiff3
pkgver=3.9.7
pkgrel=2
pkgdesc="Library for manipulation of TIFF images (legacy version)"
arch=('i686' 'x86_64')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('libjpeg' 'zlib' 'libtiff')
makedepends=('freeglut')
optdepends=('freeglut: for using tiffgt')
source=(http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz)
sha256sums=('f5d64dd4ce61c55f5e9f6dc3920fbe5a41e02c2e607da7117a35eb5c320cef6a')
options=('!libtool')
provides=('libtiff3' 'libtiff4')

build() {
  cd "${srcdir}/tiff-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/tiff-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/tiff-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Cleaning binaries and headers
  rm -rvf ${pkgdir}/usr/bin
  rm -rvf ${pkgdir}/usr/include
  # Remove documentation
  rm -rvf ${pkgdir}/usr/share/man
  rm -rvf ${pkgdir}/usr/share/doc
  # Fix libraries
  cd ${pkgdir}/usr/lib/
  # Remove main library, this is supplied by libtiff package
  rm -vf libtiff.{a,so} libtiffxx.{a,so}
  # http://www.asmail.be/msg0055009514.html
  ln -svf libtiff.so.${pkgver} libtiff.so.4
  ln -svf libtiffxx.so.${pkgver} libtiffxx.so.4
}

