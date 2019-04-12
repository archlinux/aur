# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `sratom` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=sratom
pkgname=mingw-w64-sratom
pkgver=0.6.2
pkgrel=4
pkgdesc="An LV2 Atom RDF serialisation library"
arch=('any')
url="https://drobilla.net/software/sratom/"
license=('custom:ISC')
depends=('mingw-w64-lv2' 'mingw-w64-sord')
makedepends=('mingw-w64-python')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
source=("https://download.drobilla.net/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('356e1dfde07fcc3eff99186ff79501557572f5d73338fd096bf639a82d1d4fe3c0e790627c8eb088053e4a2aeed4e548aca0a5572d1ab26316cfdb13374f10ac'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${_pkgbase}-${pkgver}"
  # remove local ldconfig call
  sed -i '/ldconfig/d' wscript
}

build() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}-${pkgver}" build-${_arch}
    pushd build-${_arch}

    CC="$_arch-gcc" python waf configure --prefix=/usr/"$_arch" #\
                         #--test
    python waf build

    popd
  done
}

check() {
  cd "${_pkgbase}-${pkgver}"
  #python waf test --verbose-tests
}


package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

  python waf install --destdir="${pkgdir}"
  # license
  install -vDm 644 COPYING \
    "${pkgdir}/usr/$_arch/share/licenses/${_pkgbase}/LICENSE"
  # docs
  install -t "${pkgdir}/usr/$_arch/share/doc/${_pkgbase}" \
    -vDm 644 {NEWS,README}

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
