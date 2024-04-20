# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=eepers
pkgname=${_pkgname}-git
pkgver=1.3.r20.g0d16401
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
    FLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 \
        -fstack-clash-protection -fcf-protection"
    gnatmake $FLAGS -gnat2012 ../eepers.adb -largs $LDFLAGS -lraylib -lm -pthread
}

package() {
    cd "${_pkgname}"
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    find assets -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/$_pkgname/{}" \;
    install -Dm 755 ./build/eepers "${pkgdir}"/usr/bin/eepers
}
