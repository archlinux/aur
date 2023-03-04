pkgname="gourou"
pkgver=0.8.1
pkgrel=1
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
conflicts=(gourou-git gourou-bin)
provides=("gourou=${pkgver}")
options=(strip)
source=("git://soutade.fr/libgourou.git#tag=v$pkgver" "git://soutade.fr/updfparser.git" "build.patch")
sha512sums=('SKIP'
            'SKIP'
            '768e49fddcabe8b4c6f771ebbddf2618ab59e7b1a399d99aa9a9881f932e092210878ef576144593684b4c3a763218c5b546dbe19fdbadeff13995245bffda19')

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
  make PWD=`pwd` BUILD_STATIC=1 BUILD_SHARED=1
}


package() {

	install -d $pkgdir/{usr/bin/,usr/lib/,/usr/include/libgourou}
	cd "libgourou"
	cp -a --no-preserve=ownership libgourou*.so "$pkgdir/usr/lib"
	cp -a --no-preserve=ownership include/*.h "$pkgdir/usr/include/libgourou/"
	cd "utils"
	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove} "$pkgdir/usr/bin"
	strip "$pkgdir/usr/bin"/*
}
