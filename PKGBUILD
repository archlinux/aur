# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=(bluespec-git bluespec-vimfiles-git bluespec-docs-git)
pkgver=r641.e330e11e
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('BSD')
depends=('haskell-old-time' 'haskell-syb' 'haskell-regex-compat' 'haskell-split')
makedepends=('git' 'gperf' 'ghc' 'tcl' 'texlive-latexextra')
# workaround for pkgrel overwritten on regen (by TkG)
# rebuild whenever some haskell depend is rebuilt
eval pkgrel=$(pacman -Si ${depends[@]} | awk '/Version/{sum+=substr($0,match($0,/[^-]+$/))}END{print sum}')
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

  # workaround until PR #430 is merged
  sed -ri 's/^TCL_ALT_SUFFIX=.*/TCL_ALT_SUFFIX=/' platform.sh
}

build(){
  cd "$srcdir/bsc"
  make GHC="ghc -dynamic" GHCJOBS=2 GHCRTSFLAGS='+RTS -M5G -A128m -RTS' install-src
  make install-doc
}

package_bluespec-git() {
  optdepends=('tcl: bluesim and bluetcl')

  cd "$srcdir/bsc"
  install -d "${pkgdir}${_prefix}"
  cp -dr --preserve=mode,timestamp ./inst/{bin,lib} "${pkgdir}${_prefix}"

  install -d "${pkgdir}/usr/bin"
  local _prog
  for _prog in bsc bluetcl; do
    sed -i "s,^BINDIR=.*$,BINDIR=${_prefix}/bin," "${pkgdir}${_prefix}/bin/${_prog}"
    ln -s "${_prefix}/bin/${_prog}" "${pkgdir}/usr/bin"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_bluespec-vimfiles-git() {
  pkgdesc='Bluespec vim files'
  depends=()

  cd "$srcdir/bsc"
  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -dr --preserve=mode,timestamp ./util/vim/{ftdetect,indent,syntax} "${pkgdir}/usr/share/vim/vimfiles"
}

package_bluespec-docs-git() {
  pkgdesc='Bluespec docs'
  depends=()

  cd "$srcdir/bsc"
  install -d "${pkgdir}${_prefix}"
  cp -dr --preserve=mode,timestamp ./inst/doc "${pkgdir}${_prefix}"
}
