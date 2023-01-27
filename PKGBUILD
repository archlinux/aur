# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libtiff-lerc
pkgver=4.5.0
pkgrel=2
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=('glibc' 'libjpeg-turbo' 'libjpeg.so' 'zlib' 'xz' 'zstd' 'lerc')
makedepends=('freeglut' 'glu' 'mesa' 'jbigkit')
optdepends=('freeglut: for using tiffgt')
provides=('libtiff=4.5.0' 'libtiff.so' 'libtiffxx.so')
conflicts=('libtiff')
source=(https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz)
sha256sums=('c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464')

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
