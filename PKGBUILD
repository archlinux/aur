# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sratom
pkgname="${_pkgname}-git"
pkgver=0.6.2.r149.a82a011
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$_pkgname/"
license=('custom:ISC')
depends=('lv2' 'sord')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
install="${_pkgname}.install"
source=("${_pkgname}::git+http://git.drobilla.net/sratom.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SRATOM_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # remove ldconfig
  sed -i '/ldconfig/d' wscript

  python waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
