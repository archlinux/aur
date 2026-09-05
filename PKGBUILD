# Maintainer: DrasLorus <draslorus@draslorus.fr>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Paulo Matias <matias@ufscar.br>

pkgname=bluespec-release
pkgver=2026.01
pkgrel=1
pkgdesc='Bluespec Compiler (BSC), stable release'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra' 'texlive-fontsextra')
optdepends=('tcl: bluesim and bluetcl')
source=("https://github.com/B-Lang-org/bsc/archive/refs/tags/$pkgver.tar.gz"
		"https://github.com/B-Lang-org/bsc/releases/download/$pkgver/yices-src-for-bsc-$pkgver.tar.gz"
		"fool-git-detection.patch"
)
noextract=("yices-src-for-bsc-$pkgver.tar.gz")
sha256sums=('f9204b7d6efd6ac2b2c1b42c80b01d179319ac33575d258719eaf73be44d4ec5'
            'a5114c8f1e04a75a06598ac9763922f9186554b6f1326c1454b2e06deafd5575'
            'ea2d646517bae39fb3a570e366580e93053a3ac1f19840ed14cb235e7a83ba81')
conflict=('bluespec-git' 'bluespec-release-git' 'bsc')		
provides=('bluespec-git' 'bsc')		
_prefix="/opt/bluespec"


prepare() {
  ln -sf "bsc-$pkgver" "$srcdir/bsc"
  cd "$srcdir/bsc"
  tar -xvf "$srcdir/yices-src-for-bsc-$pkgver.tar.gz"
  patch -p1 < "$srcdir/fool-git-detection.patch"
}

build(){
  # prevent static lib mangling with LTO (pacman#150, bsc#704)
  CXXFLAGS+=" -ffat-lto-objects"

  cd "$srcdir/bsc"
  make GHC="ghc -dynamic" GHCJOBS=4 GHCRTSFLAGS='+RTS -M8G -A128m -RTS' install-src
  make install-doc
}

package() {
  cd "$srcdir/bsc"
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
