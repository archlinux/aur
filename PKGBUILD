# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=bluespec-git
pkgver=r289.1f95696
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tk')
optdepends=('tcl: bluesim and bluetcl'
            'tk: bluewish')
source=("git+https://github.com/b-lang-org/bsc.git")
sha256sums=('SKIP')
_prefix="/opt/bluespec"

pkgver() {
  cd "$srcdir/bsc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/bsc"
  git submodule update --init --recursive
}

build(){
  cd "$srcdir/bsc"
  make GHC="ghc -dynamic" GHCJOBS=2 GHCRTSFLAGS='+RTS -M5G -A128m -RTS'
}

package() {
  cd "$srcdir/bsc"
  install -d "${pkgdir}${_prefix}"
  cp -dr --preserve=mode,timestamp ./inst/* "${pkgdir}${_prefix}"

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -dr --preserve=mode,timestamp ./util/vim/{ftdetect,indent,syntax} "${pkgdir}/usr/share/vim/vimfiles"

  install -d "${pkgdir}/usr/bin"
  local _prog
  for _prog in bsc bluetcl bluewish; do
    sed -i "s,^BINDIR=.*$,BINDIR=${_prefix}/bin," "${pkgdir}${_prefix}/bin/${_prog}"
    ln -s "${_prefix}/bin/${_prog}" "${pkgdir}/usr/bin"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

