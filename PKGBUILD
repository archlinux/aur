# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=serd
pkgname="${_pkgname}-git"
pkgver=0.30.2.r784.41a5903
pkgrel=2
pkgdesc="Lightweight C library for RDF syntax supporting reading / writing Turtle and NTriples (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/serd/"
license=('custom:ISC')
makedepends=('git' 'python')
conflicts=("${_pkgname}" "${_pkgname}-svn")
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" "lib${_pkgname}-${pkgver::1}.so")
source=("$_pkgname::git+https://gitlab.com/drobilla/serd.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP'
         'SKIP')


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

  # remove call to local ldconfig
  sed -i "/ldconfig/d" wscript
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
