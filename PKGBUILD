# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname='raddebugger'
pkgver=0.9.29
pkgrel=4
_pkgver="${pkgver}-alpha"
_gitrev="cd41ba199bbe091d348a9b2be5a3528cb8acbff0"
pkgdesc='A native, user-mode, multi-process, graphical debugger'
url='https://github.com/EpicGames/raddebugger'
arch=('x86_64')
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
  "raddbg.desktop"
)
sha256sums=('a9e1646d04c408c91ae1312b5844e79e76849f96091021501f6caa3b49688434'
            '83eb8667c0dd87d1a88a582656b155350d556d1c95970dc1b1a1821d1d0f36e7')
depends=('libx11' 'libxext' 'libxfixes' 'libgl' 'libegl' 'freetype2')
makedepends=('clang' 'lld' 'llvm')
optdepends=(
  'zenity: Display graphical dialogs'
)

prepare() {
  sed -i "s/^git_hash=.*/git_hash=${_gitrev:0:8}/g"       "${pkgname}-${_pkgver}"/build.sh
  sed -i "s/^git_hash_full=.*/git_hash_full=${_gitrev}/g" "${pkgname}-${_pkgver}"/build.sh
}

build() {
  cd "${pkgname}-${_pkgver}"
  ./build.sh clang release meta raddbg radbin radlink
}

package() {
  install -Dm0644 "raddbg.desktop"                        "${pkgdir}"/usr/share/applications/raddbg.desktop

  cd "${pkgname}-${_pkgver}"
  install -Dm0755 "build/raddbg"                          "${pkgdir}"/usr/bin/raddbg
  install -Dm0755 "build/radbin"                          "${pkgdir}"/usr/bin/radbin
  install -Dm0755 "build/radlink"                         "${pkgdir}"/usr/bin/radlink
  install -Dm0644 "build/raddbg_readme.md"                "${pkgdir}"/usr/share/raddbg/readme.md
  install -Dm0644 "src/lib_raddbg_markup/raddbg_markup.h" "${pkgdir}"/usr/include/raddbg_markup.h
  install -Dm0644 "data/logo.png"                         "${pkgdir}"/usr/share/raddbg/logo.png
}
