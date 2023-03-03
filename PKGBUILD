_pkgname=gourou
pkgname="${_pkgname}-git"
pkgver=r121.46afe77
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files (git version)"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl pugixml curl)
conflicts=(gourou gourou-bin)
provides=(gourou)
options=(strip)
source=("git://soutade.fr/libgourou.git" "git://soutade.fr/updfparser.git" "build.patch")
sha512sums=('SKIP'
            'SKIP'
            '768e49fddcabe8b4c6f771ebbddf2618ab59e7b1a399d99aa9a9881f932e092210878ef576144593684b4c3a763218c5b546dbe19fdbadeff13995245bffda19')


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
