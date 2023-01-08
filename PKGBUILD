# Maintainer: silverhikari
pkgname=sinsy-isengaara-git
_pkgname=sinsy
pkgver=0.9.6rc0.r3.g036c33a
pkgrel=4
pkgdesc="fork of sinsy made to use with qtau"
arch=('x86_64')
url="https://notabug.org/isengaara/sinsy"
license=('BSD')
depends=('hts-engine-api-git' 'sekai-git' 'boost')
makedepends=('git' 'cmake')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://notabug.org/isengaara/sinsy' 'utaudb.patch')
md5sums=('SKIP' 'SKIP')
pkgver() {
	cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_pkgname}"
    patch -p1 < "$srcdir/utaudb.patch"
}

build() {
	cmake -B build -S "sinsy" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev -DBUILD_SHARED_LIBS=ON
    make -C build
}

package() {
    cd "$srcdir/${_pkgname}/src"
    install -Dm755 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install
}
