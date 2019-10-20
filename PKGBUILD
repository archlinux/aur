# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sratom
pkgname="${_pkgname}-git"
pkgver=0.6.3.r173.bdfb8d0
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$_pkgname/"
license=('custom:ISC')
depends=('lv2' 'sord')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
source=("${_pkgname}::git+https://gitlab.com/lv2/sratom.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SRATOM_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update

  # remove local call to ldconfig
  sed -i "/ldconfig/d" wscript
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
