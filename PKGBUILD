# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir-git'
pkgver=0.5.0.dev.r2884.080078d9d6b2000c53f377be36398377a8d18cd6
pkgrel=1
pkgdesc='C17/C23 language compiler for x86_64 systems (upstream version)'
provides=('kefir' 'kefir-debug')
conflicts=('kefir' 'kefir-debug')
arch=('x86_64')
url='https://kefir.protopopov.lv'
license=('GPL3' 'BSD')

depends=()
makedepends=()
source=("kefir::git+https://git.sr.ht/~jprotopopov/kefir#branch=master")
sha512sums=('SKIP')

pkgver () {
    cd kefir
    local MAJOR_VERSION="$(sed -nr 's/#define KEFIR_VERSION_MAJOR (.*)/\1/p' headers/kefir/core/version.h)"
    local MINOR_VERSION="$(sed -nr 's/#define KEFIR_VERSION_MINOR (.*)/\1/p' headers/kefir/core/version.h)"
    local PATCH_VERSION="$(sed -nr 's/#define KEFIR_VERSION_PATCH (.*)/\1/p' headers/kefir/core/version.h)"
    local SOURCE_ID="$($PWD/scripts/get-source-id.sh)"
    printf "%s.%s.%s.dev.%s" "$MAJOR_VERSION" "$MINOR_VERSION" "$PATCH_VERSION" "$SOURCE_ID"
}

build () {
    cd kefir
    make all PROFILE=devrelease
}

package () {
    cd kefir
    make DESTDIR="$pkgdir" prefix="/usr" INSTALL_LICENSES=no install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}
