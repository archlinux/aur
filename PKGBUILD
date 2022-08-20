# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libtiff-lerc
pkgver=4.4.0
pkgrel=2
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=('glibc' 'libjpeg-turbo' 'libjpeg.so' 'zlib' 'xz' 'zstd' 'lerc')
makedepends=('freeglut' 'glu' 'mesa' 'jbigkit')
optdepends=('freeglut: for using tiffgt')
provides=('libtiff=4.4.0' 'libtiff.so' 'libtiffxx.so')
conflicts=('libtiff')
options=(debug)
source=(
  https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz
  # fix CVE-2022-2056 / CVE-2022-2057 / CVE-2022-2058: https://bugs.archlinux.org/task/75360
  $pkgname-4.4.0-fpe_tiffcrop.patch::https://gitlab.com/libtiff/libtiff/-/commit/dd1bcc7abb26094e93636e85520f0d8f81ab0fab.patch
  # fix CVE-2022-34526: https://bugs.archlinux.org/task/75608
  $pkgname-4.4.0-CVE-2022-34526.patch::https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990.patch
)
sha256sums=(
            '917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed'
            '049875c6eddef8d0d653ad069fea7483f7b9b1dc2aad8780784301fb3e34b561'
            '10220d1eecc00f830a1814c0b74388e68c4f0a38ec173038d6e5e8a6ad3cc97f'
)

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
  cd tiff-${pkgver}
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
  cd tiff-${pkgver}
  make check
}

package() {
  cd tiff-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
