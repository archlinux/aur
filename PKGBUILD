# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=eepers
pkgname=${_pkgname}-git
pkgver=1.3.r11.g7ff09ac
pkgrel=1
pkgdesc="Simple Turn-based Game"
arch=('x86_64')
url="https://github.com/tsoding/eepers"
license=('MIT')
depends=('raylib')
makedepends=('git' 'gcc-ada')
provides=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    sed -i 's|assets|/usr/share/'$_pkgname'/&|g' eepers.adb
}

build() {
    cd "${_pkgname}"
    mkdir -p build
    cd build
    # shellcheck disable=SC2086
    gnatmake $CFLAGS -gnat2012 ../eepers.adb -largs "$LDFLAGS" -lraylib -lm -pthread
}

package() {
    cd "${_pkgname}"
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    find assets -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/$_pkgname/{}" \;
    install -Dm 755 ./build/eepers "${pkgdir}"/usr/bin/eepers
}
