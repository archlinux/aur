_pkgname=gourou
pkgname="${_pkgname}-git"
pkgver=r127.c192793
pkgrel=1
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files (git version)"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
conflicts=(gourou gourou-bin)
provides=("gourou" "libgourou")
options=(strip)
source=(
	"git://soutade.fr/libgourou.git"
	"git://soutade.fr/updfparser.git"
	"build.patch"
)
sha512sums=('SKIP'
            'SKIP'
            '624a89ffbb4387ec8e91e3003522d9b0516b47ff7609251dd8fae61f363471c756892d496b8c8d01acdc5d78082b3dc7ed61003661dc0bf79a137c404380b4de'
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
	for patch in build; do
		patch --forward --strip=1 --input="../$patch.patch"
	done
}

build(){

  cd updfparser
  make BUILD_STATIC=1 BUILD_SHARED=0
  cd ../libgourou
  mkdir -p lib
  make PWD=`pwd` BUILD_STATIC=1 BUILD_SHARED=1
}

package() {
	cd libgourou
	DESTDIR=$pkgdir PREFIX=/usr make install install_headers

}
