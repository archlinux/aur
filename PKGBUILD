pkgname="gourou"
pkgver=0.8.2
pkgrel=1
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
conflicts=(gourou-git gourou-bin)
provides=("gourou=${pkgver}" "libgourou=${pkgver}")
options=(strip)
source=(
	"git://soutade.fr/libgourou.git#tag=v$pkgver"
	"git://soutade.fr/updfparser.git#commit=c5ce75b9eea8ebb2746b13eeb0f335813c615115"
	"build.patch"
)
sha512sums=('SKIP'
            'SKIP'
            '624a89ffbb4387ec8e91e3003522d9b0516b47ff7609251dd8fae61f363471c756892d496b8c8d01acdc5d78082b3dc7ed61003661dc0bf79a137c404380b4de'
)

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
