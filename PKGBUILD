pkgname=smallz4-git
pkgver=1.5.r2.9777a1d
pkgrel=1
pkgdesc="Extremely small C++ compressor with optimal parsing, fully compatible with LZ4 by Yann Collet"
arch=('any')
url="https://github.com/skandau/smallz4"
license=('MIT')
depends=()
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    echo "1.5.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"

    if command -v clang++ >/dev/null 2>&1; then
        clang++ \
        -O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing -fno-rtti -fno-exceptions \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections -fvisibility=hidden \
        -fstrict-vtable-pointers \
        -fno-asynchronous-unwind-tables \
        "${pkgname%-*}".cpp -o "${pkgname%-*}" \
        -Wl,--icf=safe \
        -Wl,--gc-sections \
        -Wl,-O3 \
        -flto \
        -fno-plt \
        -fuse-ld=lld
    else
        g++ \
        -O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing -fno-rtti -fno-exceptions \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections -fvisibility=hidden \
        "${pkgname%-*}".cpp -o "${pkgname%-*}" \
        -Wl,--gc-sections \
        -Wl,-O3 \
        -flto \
        -fno-plt
    fi
}

package() {
    cd "${pkgname%-*}"

    # Install binary
    install -Dm755 "${pkgname%-*}" "$pkgdir/usr/bin/"${pkgname%-*}""

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
