# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-ossl-git
pkgver=rel.20140328.r185.gdac0e48
pkgrel=3
pkgdesc="Most comprehensive OpenSSL module in the Lua universe."
arch=('i686' 'x86_64')
url="https://github.com/wahern/luaossl"
license=('MIT')
makedepends=('git' 'm4' 'openssl')
source=('git+https://github.com/wahern/luaossl.git#branch=master')
md5sums=('SKIP')
_luaversions=('5.1' '5.2' '5.3')
pkgver() {
  cd "$srcdir/luaossl"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "$srcdir/luaossl"
  for version in ${_luaversions[@]}; do
    echo "*** Attempting build for Lua version: $version"
    make all${version}
  done
}
package() {
  cd "$srcdir/luaossl"
  for version in ${_luaversions[@]}; do
    make prefix="$pkgdir/usr" install${version}
  done
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set et sts=0 sw=2 ts=2:
