# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `sratom` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=sratom
pkgname=mingw-w64-sratom
pkgver=0.6.8
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library"
arch=('any')
url="https://drobilla.net/software/sratom/"
license=('custom:ISC')
depends=('mingw-w64-lv2' 'mingw-w64-sord')
makedepends=('mingw-w64-gcc' 'python')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
source=("https://download.drobilla.net/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('49ec4b230a72005ab7a7a3de0bfa630a27a16f9f811ca8e7f6da7fcf6b34526577217075d428a993f95b813dd2a82a9b6892eeb2e36b66b122ada778fbb3fb95'
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
	
	export PKG_CONFIG_PATH="/usr/${_arch}/lib/pkgconfig"
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
    -vDm 644 {NEWS,README.md}

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
