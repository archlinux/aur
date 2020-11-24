# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=r3112.2121da2d
pkgrel=1
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
source=(
  "${pkgname}::git+https://github.com/sumneko/${_pkgname}.git"
  '0001-Fix-paths.patch'
  '0002-Fix-build.patch'
  'wrapper'
)
sha256sums=('SKIP'
            '52be0f8e2f609907aa5f85758c3a380496cee2c0b031eef67c07a413eb70b85d'
            '5fc36fa9fadd04fa6ec9fae4c952085a93bcdc6af83ce5434bb4be47efb31231'
            '6135c5424e5b87146aabf47651d3c95b6038865f26f25a8fce3a1ecd8c8f31fa')

pkgver() {
  cd "${_pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"

  git submodule update --init --recursive
  git apply "${srcdir}"/*.patch
}

build() {
  cd "${_pkgname}"

  ninja -C 3rd/luamake -f ninja/linux.ninja
  ./3rd/luamake/luamake rebuild
}

package() {
  cd "${_pkgname}"

  install -dm0755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a bin/Linux/* "${pkgdir}/usr/lib/${_pkgname}"

  install -dm0755 "${pkgdir}/usr/share/${_pkgname}"

  cp -a \
    main.lua platform.lua debugger.lua \
    locale script \
    "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0755 ../wrapper "${pkgdir}/usr/bin/${_pkgname}"
}
