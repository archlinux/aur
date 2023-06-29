pkgname="gourou"
pkgver=0.8.1
pkgrel=5
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
	"git://soutade.fr/updfparser.git#commit=f5f257685c17eabbeb7e73bcf4354d162b61794b"
	"build.patch"
	"gcc_stdint.patch")
sha512sums=('SKIP'
            'SKIP'
            '768e49fddcabe8b4c6f771ebbddf2618ab59e7b1a399d99aa9a9881f932e092210878ef576144593684b4c3a763218c5b546dbe19fdbadeff13995245bffda19'
            '00b83468d9ead5385c332b449b349340776d49ecb98b747a385eafbb1319b5dc8bcf51e82ddd52c3a8ecb42c98e58c2f9f132a6709fecb771e561b754baf6742')

prepare(){
	cd libgourou
	for patch in build gcc_stdint; do
		patch --forward --strip=1 --input="../$patch.patch"
	done
}

build(){

  cd updfparser
  make BUILD_STATIC=1 BUILD_SHARED=0
  cd ../libgourou
  make PWD=`pwd` BUILD_STATIC=1 BUILD_SHARED=1
}

package() {
	cd libgourou
	DESTDIR=$pkgdir PREFIX=/ make install install_headers

}
