# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sorenon-openxr-layer-git
pkgver=r15.472aa9f
pkgrel=1
pkgdesc="OpenXR layers to work around SteamVR bugs"
arch=(x86_64)
url="https://github.com/Sorenon/sorenon_openxr_layer"
license=("custom:MIT")
depends=("glibc" "gcc-libs" "openxr")
makedepends=("rust" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/Sorenon/sorenon_openxr_layer.git"
        "layer.json")
sha512sums=('SKIP'
            'ccdbf01411664c173ec49d0563fae327d5aa30d9528553d4d597ff24600d4223f9fd830df34925f2bb6bbe8d1d4ff713b1719cb879f31c9614f4e77e40c2db69')

pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    # TODO: --locked
    cargo build --release
}

package() {
    cd "$pkgname"

    install -Dm644 "target/release/liblayer_entry.so" "${pkgdir}/usr/lib/libXr_sorenon.so"
    install -Dm644 "${srcdir}/layer.json" "${pkgdir}/usr/share/openxr/1/api_layers/explicit.d/sorenon_layer.json"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
