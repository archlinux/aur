# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=1.21.2.r1.g4647fad6
pkgrel=1
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
source=(
  "${pkgname}::git+https://github.com/sumneko/${_pkgname}.git"
  'wrapper'
)
cksums=('SKIP'
        '1766996792')
sha256sums=('SKIP'
            'd61e2b4544bb3a4ef052f7d1c6dbc14a3bfd45e0488d231cccdd553b7e22243b')
b2sums=('SKIP'
        'f89be7c8e62bb1eb5fe36964f79a28cc6590358a2b6270c1a22c0929444c275a62d3dd36f27b40612de7d1a5867bf6bf4f1547e878a37870d4fa81e8447ea82d')

pkgver() {
  cd "${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"

  git submodule update --init --recursive
}

build() {
  cd "${pkgname}"

  ninja -C 3rd/luamake -f compile/ninja/linux.ninja
  ./3rd/luamake/luamake rebuild
}

package() {
  cd "${pkgname}"

  install -dm0755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a bin/Linux/* "${pkgdir}/usr/lib/${_pkgname}"

  install -dm0755 "${pkgdir}/usr/share/${_pkgname}"

  cp -a \
    main.lua platform.lua debugger.lua \
    locale script meta \
    "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0755 ../wrapper "${pkgdir}/usr/bin/${_pkgname}"
}
