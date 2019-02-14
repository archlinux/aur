# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor:  VirtualTam <virtualtam -at- flibidi -dot- net>

_pkgname="raul"
pkgname="${_pkgname}-git"
pkgver=0.8.10.r589.e0049be
pkgrel=1
epoch=1
pkgdesc="Realtime Audio Utility Library aimed at audio and musical applications"
arch=('any')
url="http://drobilla.net/software/raul/"
license=('GPL3')
depends=()
makedepends=('doxygen' 'git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+http://git.drobilla.net/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver=`grep "^RAUL_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"
  python waf configure \
    --prefix="/usr" \
    --docs \
    --docdir="/usr/share/doc/$pkgname"
  python waf build ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${_pkgname}"
  python waf install --destdir=${pkgdir}
  install -m 644 README NEWS "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/share/doc/$pkgname/raul-0/html" "$pkgdir/usr/share/doc/$pkgname"
  rm -rf "$pkgdir/usr/share/doc/$pkgname/raul-0"
}
