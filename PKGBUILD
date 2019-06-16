# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: VirtualTam <virtualtam@flibidi.net>

_pkgname=ganv
pkgname="${_pkgname}-git"
pkgver=1.5.4.r343.c4e5940
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/ganv/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('git' 'python')
provides=("$_pkgname" "$_pkgname=${pkgver//.r*/}")
conflicts=("$_pkgname")
source=("${_pkgname}::git+http://git.drobilla.net/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=`grep "^GANV_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/${_pkgname}"

  CXXFLAGS+=' -std=c++11'
  python waf configure --prefix="/usr"
  python waf build ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}"

  python waf install --destdir=${pkgdir}
}
