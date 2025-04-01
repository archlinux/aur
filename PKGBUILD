# Maintainer: Vekhir <vekhir AT yahoo DOT com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Paulo Matias <matias@ufscar.br>

pkgname=bsc
pkgver=2025.01.1
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD-3-Clause')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra' 'texlive-fontsextra')
checkdepends=('dejagnu' 'iverilog' 'pkg-config' 'systemc' 'tcsh' 'time')
optdepends=('tcl: bluesim and bluetcl')
source=("bsc-${pkgver}::https://github.com/B-Lang-org/bsc/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/B-Lang-org/bsc/releases/download/${pkgver}/yices-src-for-bsc-${pkgver}.tar.gz")
sha256sums=('6b08d6893e454d26ab12a8b68c5b7383d2060e10817c9fb4d3d19084a4f740f5'
            'a7211d089be68303983cc644b70edaae8efab529ff63fd8670a4f20119888781')
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
  cd "$srcdir/bsc-${pkgver}/testsuite"
  make check
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
