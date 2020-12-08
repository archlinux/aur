# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=r3214.e818b4bd
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
            'e5f139bd85d4bee09c17733b22398485a0bc53caf6301e42c65b57bdbe6f5b31'
            '920ef2e6fb1144277406578a944a462354ac587af967c907eec8b8cd0481a653'
            '6135c5424e5b87146aabf47651d3c95b6038865f26f25a8fce3a1ecd8c8f31fa')

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
  git apply "${srcdir}"/*.patch
}

build() {
  cd "${pkgname}"

  ninja -C 3rd/luamake -f ninja/linux.ninja
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
