# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>
# Contributor: Ivan "Penter" <ivaiva1999ivaiva@gmail.com>

_pkgname=cpr
pkgname=$_pkgname-git
_pkgauthor=omgitsaheadcrab
pkgver=1.7.2.r8.g4bae8a2
pkgrel=1
pkgdesc="C++ Requests: Curl for People"
arch=("i686" "x86_64")
url="https://github.com/libcpr/cpr"
license=("MIT")
depends=("curl")
makedepends=("git" "cmake")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}::git+${url}")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCPR_LIBRARY=/usr/lib CPR_INCLUDE_DIR=/usr/include -DINSECURE_CURL=ON -DBUILD_CPR_TESTS=OFF -DUSE_SYSTEM_CURL=ON .
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/include"
	cp -r lib/libcpr* "${pkgdir}/usr/lib"
	cp -r include/cpr "${pkgdir}/usr/include"
    cp -r cpr_generated_includes/cpr "${pkgdir}/usr/include"
}
