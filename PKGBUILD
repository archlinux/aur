# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=2.5.5.r0.g4f74c75c
pkgrel=1
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
provides=('lua-language-server')
conflicts=('lua-language-server')
depends=('bash' 'gcc-libs')
makedepends=('git' 'ninja')
source=(
  "${pkgname}::git+https://github.com/sumneko/${_pkgname}.git"
  'wrapper'
)
sha256sums=('SKIP'
            '117a7926e0d4a8cc55b6c5c4d621bbcbbfeb872f9eec0bb87707b9bbbb68fbae')
b2sums=('SKIP'
        'ec365fac615949e55c0a7cae3764f8b73172cd99f09f2ab31278b78c8d6b926ea41988ae066a55e33792bdd5e69101862abe96f69bd615dc07f78588b05f590e')

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

  install -dm0755 "$pkgdir/usr/lib/$_pkgname/bin"
  install -m0755 -t "$pkgdir/usr/lib/$_pkgname/bin" bin/$_pkgname
  install -m0644 -t "$pkgdir/usr/lib/$_pkgname/bin" bin/main.lua

  install -m0644 -t "$pkgdir/usr/lib/$_pkgname" {debugger,main}.lua
  cp -r locale meta script "$pkgdir/usr/lib/$_pkgname"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm0755 "$srcdir/wrapper" "${pkgdir}/usr/bin/${_pkgname}"
}
