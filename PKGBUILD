# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sord
pkgname="${_pkgname}-git"
pkgver=0.16.2.r401.55ab1c4
pkgrel=1
pkgdesc="A lightweight C library for storing RDF statements in memory"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/sord/"
license=('custom:ISC')
depends=('pcre' 'serd')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
install="${_pkgname}.install"
source=("${_pkgname}::git+http://git.drobilla.net/sord.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SORD_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python ./waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
