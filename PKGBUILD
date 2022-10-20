# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=bluespec-git
pkgver=r721.a6304315
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra' 'texlive-fontsextra')
optdepends=('tcl: bluesim and bluetcl')
# workaround for pkgrel overwritten on regen (by TkG)
# rebuild whenever some haskell depend is rebuilt
eval pkgrel=$(LC_ALL=C pacman -Si ${depends[@]} | awk '/Version/{sum+=substr($0,match($0,/[^-]+$/))}END{print sum}')
source=("git+https://github.com/b-lang-org/bsc.git"
        "git+https://github.com/SRI-CSL/yices2.git")
sha256sums=('SKIP'
            'SKIP')
_prefix="/opt/bluespec"

pkgver() {
  cd "$srcdir/bsc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/bsc"
  git submodule init
  git config submodule.externals/vendor/yices/v2.6/yices2.url "$srcdir/yices2"
  git submodule update
}

build(){
  cd "$srcdir/bsc"
  make GHC="ghc -dynamic" GHCJOBS=4 GHCRTSFLAGS='+RTS -M5G -A128m -RTS' install-src
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
