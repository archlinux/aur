# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.2.2
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://giflib.sourceforge.net/'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml' 'imagemagick')
source=(https://downloads.sourceforge.net/project/giflib/${_pkgbasename}-${pkgver}.tar.gz
        giflib-5.1.9-fix-missing-quantize-API-symbols.patch
        giflib-5.1.9-make-flags.patch)
sha512sums=('0865ab2b1904fa14640c655fdb14bb54244ad18a66e358565c00287875d00912343f9be8bfac7658cc0146200d626f7ec9160d7a339f20ba3be6b9941d73975f'
            '5de1e8724f5221fa3637b4e6a482f650f7608673e2c9200233290018ec8a0bf1beea049b3979b5f57dbf2b2a5fda409324e636e9af10582fd01c71d92d4de3b3'
            '8b8d6f483a18467bf6ad169fec04f9ef61534d3e25e1714d39231620142e64672dc336b347b02c8f74172b30e94b104edc83619b8e156ad18a4af521f65d1e31')

prepare() {
  cd ${_pkgbasename}-${pkgver}
  patch -Np1 < ../giflib-5.1.9-fix-missing-quantize-API-symbols.patch
  patch -Np1 < ../giflib-5.1.9-make-flags.patch
}

build() {
  cd ${_pkgbasename}-${pkgver}
  make CC="gcc -m32"
}

check() {
  cd ${_pkgbasename}-${pkgver}
  make check
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
