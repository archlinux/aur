# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sord
pkgname="${_pkgname}-git"
pkgver=0.16.2.r412.9c11543
pkgrel=1
pkgdesc="Lightweight C library for storing RDF statements in memory (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/sord/"
license=('custom:ISC')
depends=('pcre' 'serd')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
install="${_pkgname}.install"
source=("${_pkgname}::git+https://gitlab.com/drobilla/sord.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SORD_VERSION" wscript | cut -d "'" -f 2`
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

  python ./waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
