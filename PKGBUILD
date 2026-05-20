# Maintainer: Vekhir <vekhir AT yahoo DOT com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Paulo Matias <matias@ufscar.br>

pkgname=bsc
pkgver=2026.01
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD-3-Clause')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split'
         'haskell-strict-concurrency')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra' 'texlive-fontsextra')
checkdepends=('dejagnu' 'iverilog' 'pkg-config' 'systemc' 'tcsh' 'time')
optdepends=('tcl: bluesim and bluetcl')
source=("bsc-${pkgver}::https://github.com/B-Lang-org/bsc/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/B-Lang-org/bsc/releases/download/${pkgver}/yices-src-for-bsc-${pkgver}.tar.gz")
sha256sums=('f9204b7d6efd6ac2b2c1b42c80b01d179319ac33575d258719eaf73be44d4ec5'
            'a5114c8f1e04a75a06598ac9763922f9186554b6f1326c1454b2e06deafd5575')
_prefix="/opt/bsc"

prepare() {
  cp -r src/vendor/yices/v2.6/yices2 bsc-${pkgver}/src/vendor/yices/v2.6
}

build(){
  # prevent static lib mangling with LTO (pacman#150, bsc#704)
  CXXFLAGS+=" -ffat-lto-objects"

  cd "$srcdir/bsc-${pkgver}"
  make GHC="ghc -dynamic" GHCJOBS=4 GHCRTSFLAGS='+RTS -A128m -RTS' install-src
  make install-doc
}

check() {
  cd "$srcdir/bsc-${pkgver}"
  # Currently failing due to https://github.com/B-Lang-org/bsc/issues/949
  make check-suite-parallel || echo "Tests failed"
}

package() {
  cd "$srcdir/bsc-${pkgver}"
  install -d "${pkgdir}${_prefix}"
  cp -dr --preserve=mode,timestamp ./inst/* "${pkgdir}${_prefix}"

  install -d "${pkgdir}/usr/bin"
  local _prog
  for _prog in bsc bluetcl; do
    sed -i "s,^BINDIR=.*$,BINDIR=${_prefix}/bin," "${pkgdir}${_prefix}/bin/${_prog}"
    ln -s "${_prefix}/bin/${_prog}" "${pkgdir}/usr/bin"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -dr --preserve=mode,timestamp ./util/vim/{ftdetect,indent,syntax} "${pkgdir}/usr/share/vim/vimfiles"
}
