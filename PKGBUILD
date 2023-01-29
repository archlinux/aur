# Maintainer: cysp74 <cysp74@gmail.com>

_name=fstl
pkgname="${_name}-git"
pkgver=0.9.4.r27.g9da758b
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('x86_64')
license=('MIT')
depends=('qt5-base')
makedepends=("icoutils" "cmake")
source=("${_name}::git+https://github.com/fstl-app/fstl.git" "fstl.desktop")
sha256sums=('SKIP' '53d2a7911cacc1ca8e9fe823e8ecf2777c1158f51d2b909ebb106d976c70bec5')
provides=("fslt=${pkgver}" "fslt-git=${pkgver}")
conflicts=('fslt')

pkgver() {
	git -C "${_name}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${_name}"
    # placeholder if anything needed in future
}

build() {
	cd "${srcdir}/${_name}"
    cmake -B build \
    	-DCMAKE_BUILD_TYPE='None' \
    	-DCMAKE_INSTALL_PREFIX='/usr' \
    	-Wno-dev
    cmake --build build

    sed -n '/Copyright/,/PROVIDED/p' README.md > LICENSE

    pushd "exe"
    icotool --extract --index=6 --output=../fstl.png fstl.ico
    popd
}

package() {
    cd "${srcdir}/${_name}"

    DESTDIR="$pkgdir" cmake --install build

    install -D -m644 fstl.png "${pkgdir}/usr/share/pixmaps/fstl.png"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/fstl.desktop" "${pkgdir}/usr/share/applications/fstl.desktop"

}
