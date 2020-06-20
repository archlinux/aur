# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lua-sitegen-git
pkgver=r305.3b8eea6
pkgrel=1
pkgdesc="Static site generator in MoonScript"
arch=('any')
url='http://leafo.net/sitegen'
provides=('sitegen')
license=('custom:unknown')
depends=('lua-cosmo'
       'moonscript'
       'lua-socket'
       'lua-cjson'
       'lua-date'
       'lua-discount'
       'lua-ansicolors'
       'lua-web_sanitize')
makedepends=('luarocks' 'git')
source=("lua-sitegen::git+https://github.com/leafo/sitegen")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/sitegen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p 5.3

  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../sitegen/"sitegen-dev-1.rockspec")
}

package() {
  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}