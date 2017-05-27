# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=lualdap-devurandom-git
_pkgver_comparable=1.2.3
pkgver=master
pkgrel=3
pkgdesc="lua binding to openldap"
arch=('any')
url="https://github.com/devurandom/lualdap"
# see also https://github.com/luaforge/lualdap/network
license=('MIT')
depends=('openldap>=2.1' 'lua51')
makedepends=('git')
source=("git+https://github.com/devurandom/lualdap.git"
        "allow-uri.patch")
sha1sums=('SKIP'
          'a5185d05bf737707937bf3f7177afb33160ff5ec')

pkgver() {
  cd "${srcdir}/lualdap"
  printf "%s.%s" "$_pkgver_comparable" "$(git rev-parse --short HEAD)"
}

build() {
  local lua
  cd "${srcdir}/lualdap"
  git apply "${srcdir}/allow-uri.patch"
  sed -i 's/^LUA *:=.*/LUA := lua5.1/' config
  make
}

package() {
  cd "${srcdir}/lualdap"
  mkdir -p "${pkgdir}/usr/lib/lua/5.1"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  make install DESTDIR="${pkgdir}"
  cp -r doc/us "${pkgdir}/usr/share/doc/${pkgname}/html"
  cp CONTRIBUTORS.md LICENSE.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
