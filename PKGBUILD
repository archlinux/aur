# Maintainer: Daniel Fürst <daniel@fuerst.priv.at>

# pkgver, pkgrel and the checksum of the source archive are filled in by the workflow
# .github/workflows/packaging.yml for every new version before it goes to the AUR (S034); 'SKIP'
# keeps a local makepkg working. .SRCINFO is generated, not kept here.
pkgname=hitokoto
pkgver=0.10.0
pkgrel=1
pkgdesc="A native, single-file hybrid Markdown editor"
arch=('x86_64')
url="https://github.com/Daniel-Fuerst/hitokoto"
license=('GPL-3.0-or-later' 'OFL-1.1')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'qt6-base'
    'qt6-svg'
)
makedepends=(
    'cmake'
    'ninja'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "hitokoto.desktop"
)
sha256sums=(
    '3368e846e51d4b167d48c76f212a7017a1446ec3f440307af9c72e1aef980c18'
    '6e780a4fce0fc06cb349b88a8976bb2793cdbe949f60afb0573de375083659b6'
)

build() {
    local _src="${srcdir}/${pkgname}-${pkgver}"
    if [ ! -d "$_src" ]; then
        _src="${srcdir}/${pkgname}"
    fi

    cmake -B build -S "$_src" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHITOKOTO_VERSION="$pkgver" \
        -DHITOKOTO_BUILD_TESTS=OFF \
        -DHITOKOTO_BUILD_BENCHMARKS=OFF \
        -DHITOKOTO_BUILD_FUZZERS=OFF \
        -DHITOKOTO_WARNINGS_AS_ERRORS=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    local _src="${srcdir}/${pkgname}-${pkgver}"
    if [ ! -d "$_src" ]; then
        _src="${srcdir}/${pkgname}"
    fi

    DESTDIR="$pkgdir" cmake --install build

    # Desktop entry
    install -Dm644 "$srcdir/hitokoto.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Scalable application icon
    install -Dm644 "$_src/icons/hitokoto.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # License
    install -Dm644 "$_src/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The math font compiled into the program (S045, ADR 0014); versions before it have none.
    if [ -f "$_src/fonts/stix-two-math/OFL.txt" ]; then
        install -Dm644 "$_src/fonts/stix-two-math/OFL.txt" \
            "$pkgdir/usr/share/licenses/$pkgname/OFL-STIX-Two-Math.txt"
    fi
}
