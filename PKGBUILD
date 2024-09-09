# Maintainer: Vekhir <vekhir AT yahoo DOT com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Paulo Matias <matias@ufscar.br>

pkgname=bsc
pkgver=2024.07
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
sha256sums=('dd3a217ab17e383401bc52a3437fe2fdd02f9bb67e84295dcb872694ce4b4c85'
            'a7211d089be68303983cc644b70edaae8efab529ff63fd8670a4f20119888781')
_prefix="/opt/bsc"

prepare() {
  ls -la
  ls -la bsc-${pkgver}/src/vendor/yices/v2.6/yices2
  ls -la src
  ls -la src/vendor
  ls -la src/vendor/yices
  ls -la src/vendor/yices/v2.6
  ls -la src/vendor/yices/v2.6/yices2
  cp -r src/vendor/yices/v2.6/yices2 bsc-${pkgver}/src/vendor/yices/v2.6
  ls -la bsc-${pkgver}/src/vendor/yices/v2.6/yices2
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
