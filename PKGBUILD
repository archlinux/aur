# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=r2459.3c4203ac
pkgrel=2
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
source=(
  "git+https://github.com/sumneko/${_pkgname}.git"
  '0001-Fix-paths.patch'
  '0002-Disable-Test-Target.patch'
  'wrapper'
)
sha256sums=('SKIP'
            'd0f384fccc0ff6a6422af75d7380af4f67522a08efac7632d42cdf4921d70f4e'
            '7dde63f7c372a06ec951e705b5690ed5500a8dab601266dcca57d603cd0675a6'
            '6135c5424e5b87146aabf47651d3c95b6038865f26f25a8fce3a1ecd8c8f31fa')

pkgver () {
  cd "${_pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare () {
  cd "${_pkgname}"

  git submodule update --init --recursive
  git apply "${srcdir}"/*.patch
}

build () {
  cd "${_pkgname}"

  ninja -C 3rd/luamake -f ninja/linux.ninja
  ./3rd/luamake/luamake rebuild
}

package () {
  cd "${_pkgname}"

  install -dm0755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a bin/Linux/* "${pkgdir}/usr/lib/${_pkgname}"

  install -dm0755 "${pkgdir}/usr/share/${_pkgname}"

  cp -a main.lua script script-beta "${pkgdir}/usr/share/${_pkgname}"
  # cp -a main-beta.lua "${pkgdir}/usr/share/${_pkgname}/main.lua"

  cp -a libs locale platform.lua "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0755 ../wrapper "${pkgdir}/usr/bin/${_pkgname}"
}
