# Maintainer: VCalV
pkgname="gourou"
pkgver=0.8.7
_updfcommit="6060d123441a06df699eb275ae5ffdd50409b8f3"
pkgrel=3
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL-3.0-only')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
makedepends=()
conflicts=(gourou-git gourou-bin gourou-appimage)
provides=("gourou=${pkgver}" "libgourou=${pkgver}")
options=(strip)
source=(
	"gourou_$pkgver.tar.gz::https://forge.soutade.fr/soutade/libgourou/archive/v$pkgver.tar.gz"
	"updf_$_updfcommit.tar.gz::https://forge.soutade.fr/soutade/uPDFParser/archive/$_updfcommit.tar.gz"
)
sha512sums=(
            '534662860660c06aedf9f43cfcd5d835ea2a1b0c9f7d0ed65583b4c6a4e78fc0e348cad403e72baa2eaafaca89a037fc4269ebd531fa05d97f33a2a8ff0e4122'
            'fe90e45aebbe1f60010778002191be53955d6608d37dba05778eb43dc5d8933d0daf57d49635d97405cefefaf5ddd5916b9895cafd90367a22f4a9fdbcb3526a'
)

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
