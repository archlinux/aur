# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `sratom` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=sratom
pkgver=0.6.2
pkgrel=2
pkgdesc="An LV2 Atom RDF serialisation library"
arch=('any')
url="https://drobilla.net/software/sratom/"
license=('custom:ISC')
depends=('mingw-w64-lv2' 'mingw-w64-sord')
makedepends=('mingw-w64-python')
source=("https://download.drobilla.net/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('356e1dfde07fcc3eff99186ff79501557572f5d73338fd096bf639a82d1d4fe3c0e790627c8eb088053e4a2aeed4e548aca0a5572d1ab26316cfdb13374f10ac'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${pkgname}-${pkgver}"
  # remove local ldconfig call
  sed -i '/ldconfig/d' wscript
}

build() {
  cd "${pkgname}-${pkgver}"

  for _arch in "${_architectures[@]}"; do
    python2 waf configure --prefix=/usr/"$_arch" \
                         --test
    python2 waf build
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  python2 waf test --verbose-tests
}


package() {
  cd "${pkgname}-${pkgver}"
  python2 waf install --destdir="${pkgdir}"
  # license
  install -vDm 644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {NEWS,README}
}
# vim:set ts=2 sw=2 et:
