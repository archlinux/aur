# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=serd
pkgname=mingw-w64-serd
pkgver=0.30.8
pkgrel=1
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples."
arch=('any')
url="https://drobilla.net/software/serd/"
license=('custom:ISC')
depends=()
makedepends=('mingw-w64-gcc' 'python')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
source=("https://download.drobilla.net/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('d12c4dea1a15b2aed9fb9d640affae23a4fbfb53b7f873af30b462ce96f3c22ee464f5b111f87a221e6ac51f4885c23bba023892331ab10d0a8aa0e27fcbd0fa'
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
