# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=serd
pkgname="${_pkgname}-git"
pkgver=0.30.1.r752.d14838c
pkgrel=1
pkgdesc="A lightweight C library for RDF syntax which supports reading and writing Turtle and NTriples"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/serd/"
license=('custom:ISC')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
install="${_pkgname}.install"
source=("$_pkgname::git+https://gitlab.com/drobilla/serd.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SERD_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  python ./waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$_pkgname"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
