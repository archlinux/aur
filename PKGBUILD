# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=serd
pkgname="${_pkgname}-svn"
pkgver=0.21.1.r489
pkgrel=1
pkgdesc="A lightweight C library for RDF syntax which supports reading and writing Turtle and NTriples"
arch=('i686' 'x86_64')
url="http://dev.drobilla.net/browser/serd"
license=('custom:ISC')
depends=('glibc')
makedepends=('python2' 'subversion')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${_pkgname}.install"
source="$_pkgname::svn+http://svn.drobilla.net/serd/trunk"
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local rel=`grep "^SERD_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 ./waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$_pkgname"

  python2 waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
