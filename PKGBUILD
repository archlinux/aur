# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libtiff-lerc
pkgver=4.7.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=('glibc' 'libjpeg-turbo' 'libjpeg.so' 'zlib' 'xz' 'zstd' 'lerc')
makedepends=('freeglut' 'glu' 'mesa' 'jbigkit')
otiffptdepends=('freeglut: for using tiffgt')
provides=('libtiff=4.6.0' 'libtiff.so' 'libtiffxx.so')
conflicts=('libtiff')
source=(https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz)
b2sums=('156ad8a9058363885dc0607ab4538fba4cc802041c4b04ea1ac540191168c98c0caa8f2c5b07e6327d5b2ccec1bef3e08dbe70b6be7329738da8f93b76fb3994')

prepare() {
  cd tiff-${pkgver}
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}


build() {
  cd tiff-${pkgver//rc*/}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-ld-version-script \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc/${pkgname}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd tiff-${pkgver//rc*/}
  make check
}

package() {
  cd tiff-${pkgver//rc*/}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
