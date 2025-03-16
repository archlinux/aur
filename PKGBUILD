# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-git"
pkgver=r148.469d378
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files (git version)"
arch=('x86_64')
license=('LGPL-3.0-only')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
makedepends=(git)
conflicts=(gourou gourou-bin gourou-appimage)
provides=("gourou=${pkgver}" "libgourou=${pkgver}")
options=(strip)
source=(
	"git://forge.soutade.fr/soutade/libgourou.git"
	"git://forge.soutade.fr/soutade/updfparser.git"
)
sha512sums=('SKIP'
            'SKIP'
)


pkgver() {
  cd "libgourou"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
	cd libgourou
	mkdir -p lib
}

build(){

  cd updfparser
  make BUILD_STATIC=1 BUILD_SHARED=0
  cd ../libgourou
  CXXFLAGS="-I../updfparser/include" BUILD_SHARED=1 BUILD_UTILS=1 make UPDFPARSERLIB=../updfparser/libupdfparser.a

}

package() {
	cd libgourou
	DESTDIR=$pkgdir PREFIX=/usr make install install_headers UPDFPARSERLIB=../updfparser/libupdfparser.a
	install -Dm444  ./utils/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
