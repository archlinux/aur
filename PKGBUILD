# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.2.1
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://giflib.sourceforge.net/'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml')
source=(https://downloads.sourceforge.net/project/giflib/${_pkgbasename}-${pkgver}.tar.gz
        giflib-5.1.9-fix-missing-quantize-API-symbols.patch
        giflib-5.1.9-make-flags.patch)
sha512sums=('4550e53c21cb1191a4581e363fc9d0610da53f7898ca8320f0d3ef6711e76bdda2609c2df15dc94c45e28bff8de441f1227ec2da7ea827cb3c0405af4faa4736'
            '5de1e8724f5221fa3637b4e6a482f650f7608673e2c9200233290018ec8a0bf1beea049b3979b5f57dbf2b2a5fda409324e636e9af10582fd01c71d92d4de3b3'
            'b9afd436c31b971087485c7b476f796817e6ee4f237ef8a0e61e47f8ac59fbe5e673d7194895fcc9aafbb79f133469d27c2f69041ae0cccd9acb78667c0222dd')

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
  make PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
