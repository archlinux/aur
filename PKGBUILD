# Maintainer: VCalV
pkgname="gourou"
pkgver=0.8.6
_updfcommit="6060d123441a06df699eb275ae5ffdd50409b8f3"
pkgrel=3
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
makedepends=()
conflicts=(gourou-git gourou-bin)
provides=("gourou=${pkgver}" "libgourou=${pkgver}")
options=(strip)
source=(
	"gourou_$pkgver.tar.gz::https://forge.soutade.fr/ismail/libgourou/archive/v$pkgver.tar.gz"
	"updf_$_updfcommit.tar.gz::https://forge.soutade.fr/soutade/uPDFParser/archive/$_updfcommit.tar.gz"
	"build.patch"
)
sha512sums=(
            '86f306b3ef6711840905bd08cc608bb7ed8d82a9f4c675aabb04af86347ce13b67324f462157c3cfd2681829b0d4da6bd72fb56c0595c1a693db691c9972cf56'
            'fe90e45aebbe1f60010778002191be53955d6608d37dba05778eb43dc5d8933d0daf57d49635d97405cefefaf5ddd5916b9895cafd90367a22f4a9fdbcb3526a'
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
