# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=serd
pkgname=mingw-w64-serd
pkgver=0.30.0
pkgrel=6
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples."
arch=('any')
url="https://drobilla.net/software/serd/"
license=('custom:ISC')
depends=()
makedepends=('mingw-w64-python')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
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
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}-${pkgver}" build-${_arch}
    pushd build-${_arch}

    CC="$_arch-gcc" python waf configure --prefix=/usr/"$_arch" \
                         --mandir=/usr/$_arch/share/man #\
                         #--test
    python waf

    popd
  done
}

check() {
  cd "${_pkgbase}-${pkgver}"
#  python waf test
}

package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

    python waf install --destdir="${pkgdir}"
    # license
    install -vDm 644 COPYING \
      "$pkgdir/usr/$_arch/share/licenses/${_pkgbase}/LICENSE"
    # docs
    install -t "$pkgdir/usr/$_arch/share/doc/${_pkgbase}" \
      -vDm 644 {AUTHORS,NEWS,README.md}

    # move DLL to bin directory
    install -d $pkgdir/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin

    # strip
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    popd
  done
}
# vim:set ts=2 sw=2 et:
