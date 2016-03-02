# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-cqueues-git
pkgver=r845.7595820 # As per latest release as of 29 Feb. 2016
pkgrel=2
pkgdesc="Asynchronous networking, threading, and notification framework for Lua."
arch=('i686' 'x86_64')
url="https://github.com/wahern/cqueues"
license=('MIT')
depends=('m4' 'openssl')
makedepends=('git')
source=('git+https://github.com/wahern/cqueues.git#branch=master')
md5sums=('SKIP')
_luaversions=('5.1' '5.2' '5.3')
pkgver() {
  cd "$srcdir/cqueues"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "$srcdir/cqueues"
  for version in ${_luaversions[@]}; do
    echo "*** Attempting build for Lua version: $version"
    make cqueues${version}
  done
}
package() {
  cd "$srcdir/cqueues"
  for version in ${_luaversions[@]}; do
    make prefix="$pkgdir/usr" install${version}
  done
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set et sts=0 sw=2 ts=2:
