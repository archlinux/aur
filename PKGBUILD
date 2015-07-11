# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=sratom
pkgname="${_pkgname}-svn"
pkgver=0.4.7.r5694
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$_pkgname/"
license=('custom:ISC')
depends=('lv2' 'sord')
makedepends=('subversion' 'python2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::svn+http://svn.drobilla.net/lad/trunk/${_pkgname}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local rel=`grep "^SRATOM_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # remove ldconfig
  sed -i '/ldconfig/d' wscript

  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
