# Maintainer: DrasLorus <draslorus@draslorus.fr>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Paulo Matias <matias@ufscar.br>

pkgname=bluespec-release
pkgver=2025.01.1
pkgrel=1
pkgdesc='Bluespec Compiler (BSC), stable release'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra' 'texlive-fontsextra')
optdepends=('tcl: bluesim and bluetcl')
source=("https://github.com/B-Lang-org/bsc/archive/refs/tags/$pkgver.tar.gz"
		"https://github.com/B-Lang-org/bsc/releases/download/2025.01.1/yices-src-for-bsc-$pkgver.tar.gz"
		"fool-git-detection.patch"
		"fix-ldflags.patch")
noextract=("yices-src-for-bsc-$pkgver.tar.gz")
sha256sums=('6b08d6893e454d26ab12a8b68c5b7383d2060e10817c9fb4d3d19084a4f740f5'
            'a7211d089be68303983cc644b70edaae8efab529ff63fd8670a4f20119888781'
            '03b6c8b7fa05f37d0e9211c36764be88d624de63439b99b938eebd08be84cacd'
            '8f551d0a67c1d3b092b1681a341c3d3a580f18a22af57421b487332450ca7d40')
conflict=('bluespec-git' 'bluespec-release-git')		
provides=('bluespec-git')		
_prefix="/opt/bluespec"


prepare() {
  ln -sf "bsc-$pkgver" "$srcdir/bsc"
  cd "$srcdir/bsc"
  tar -xvf "$srcdir/yices-src-for-bsc-$pkgver.tar.gz"
  patch -p1 < "$srcdir/fool-git-detection.patch"
  patch -p1 < "$srcdir/fix-ldflags.patch"
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
