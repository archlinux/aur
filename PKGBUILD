# Maintainer: Daniel Fürst <daniel@fuerst.priv.at>

pkgname=hitokoto
pkgver=$(git ls-remote --tags --refs --sort="-v:refname" "https://github.com/Daniel-Fuerst/hitokoto.git" | head -n1 | sed 's/.*refs\/tags\/v//')
pkgrel=1
pkgdesc="A native, single-file hybrid Markdown editor"
arch=('x86_64' 'aarch64')
url="https://github.com/Daniel-Fuerst/hitokoto"
license=('GPL-3.0-or-later')
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
    'SKIP'
    'eabd8f8ea10edf6b570fe7772df7219c78ef7a63fe846cd7044ddf12f5e754e9'
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
}
