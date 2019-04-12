# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=serd
pkgname=mingw-w64-serd
pkgver=0.30.0
pkgrel=1
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples."
arch=('any')
url="https://drobilla.net/software/serd/"
license=('custom:ISC')
depends=()
makedepends=('mingw-w64-python')
source=("https://download.drobilla.net/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('23ff30f2d3dd622bdd65deee36cb92ae5f4a0c539cf32a1bd9802f2d7cf4aa3e96f25d2fe579277d1ab943f6d25c0be68d7b4863f83d4733f489462620a4c1bb'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${_pkgbase}-${pkgver}"
  # remove call to local ldconfig
  sed -i "/ldconfig/d" wscript
}

build() {
  cd "${_pkgbase}-${pkgver}"

  for _arch in "${_architectures[@]}"; do
    CC="$_arch-gcc" python waf configure --prefix=/usr/"$_arch" \
                         --mandir=/usr/share/man \
                         --test
    python waf
  done
}

check() {
  cd "${_pkgbase}-${pkgver}"
  python waf test
}

package() {
  cd "${_pkgbase}-${pkgver}"
  python waf install --destdir="${pkgdir}"
  # license
  install -vDm 644 COPYING \
    "$pkgdir/usr/share/licenses/${_pkgbase}/LICENSE"
  # docs
  install -t "$pkgdir/usr/share/doc/${_pkgbase}" \
    -vDm 644 {AUTHORS,NEWS,README.md}
}
# vim:set ts=2 sw=2 et:
