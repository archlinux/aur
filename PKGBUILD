# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libtiff-lerc
pkgver=4.6.0
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
b2sums=('aa3d51ffb7d800424a05e6a12e2eaad41adfe7d676650d2857bcc073a25627be88372410a27126e9c067692060c26bd2dec80a42a2188197f6f3ff9d8507fc8f')

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
