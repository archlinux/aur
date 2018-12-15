# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=lua51-lualdap-git
pkgver=master
pkgrel=2
pkgdesc="lua binding to openldap"
arch=('i686' 'x86_64')
url="https://github.com/lualdap/lualdap"
# see also https://github.com/luaforge/lualdap/network
license=('MIT')
provides=('lua51-lualdap')
depends=('openldap>=2.1' 'lua51')
makedepends=('git')
source=("git+https://github.com/lualdap/lualdap.git")
sha1sums=('SKIP')
_luaBin=lua5.1

pkgver() {
  cd "${srcdir}/lualdap"
  git describe --long --tags | sed -r 's/[vV]*(.*)-([^-]*)-(g[^-]+)/\1.r\2.\3/'
}

build() {
  cd "${srcdir}/lualdap"
  sed -i "s/^LUA *:=.*/LUA := lua$($_luaBin -v 2>&1 | grep -Eo '\<[5-9]\..')/" config
  make
}

package() {
  cd "${srcdir}/lualdap"
  mkdir -p "${pkgdir}/usr/lib/lua/$($_luaBin -v 2>&1 | grep -Eo '\<[5-9]\..')"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  make install DESTDIR="${pkgdir}"
  cp -r doc/us "${pkgdir}/usr/share/doc/${pkgname}/html"
  cp README.md CONTRIBUTORS.md LICENSE.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
