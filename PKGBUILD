# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=martin
pkgdesc="A tile server able to generate and serve vector tiles on the fly"
url="https://maplibre.org/martin/"
_git_organisation=maplibre

pkgver=0.19.3
pkgrel=1
_tag="martin-v${pkgver}"

arch=("x86_64" "i686")
license=("Apache-2.0 OR MIT")

depends=(
    "gcc-libs"
    "glibc"
)
makedepends=(
    "cargo"
    "npm"
)

options=("!lto")
backup=("etc/${pkgname}/config.yaml")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_git_organisation}/${pkgname}/archive/refs/tags/${_tag}.tar.gz"
    "${pkgname}-${pkgver}-LICENSE-APACHE::https://github.com/${_git_organisation}/${pkgname}/raw/refs/tags/${_tag}/LICENSE-APACHE"
    "${pkgname}-${pkgver}-LICENSE-MIT::https://github.com/${_git_organisation}/${pkgname}/raw/refs/tags/${_tag}/LICENSE-MIT"
    "${pkgname}.service"
    "${pkgname}.sysusers.d"
    "${pkgname}-config.yaml"
)
b2sums=(
    "2665271503f8166ca66bce2645026164a1fc090968a5d7c9f23bc72f52906d012101f8d5271794f3879c4c8557222826cac2bb41e9856e0cab2670c3b4a2c2be"
    "cb5ba44d3653218aa76bc8b1d7c1d26b3a72dd35da7490d430a5dda727e9750015c28206d8d7e7c29701dd0c3d24198ff159f2566aff72f9f6edb1f493c0a968"
    "fc19c34e958648930a8d8cc56542ffd8eabdea36954d61e9e2f8c6b7f48bef66a61233c5097a5b4f40b79321bfb16b8ef445de0460af115413f7fd3dea825bc9"
    "c3b79402f4ae27fd46915e5aab9efb7722ccc2c1d37155119c32e59fce695b784b98bf83aa46e80f6a83756850b8794ee0752eaebd9a9001d48b0f4d5ae791ca"
    "24e80b2adf58036276b6026e41914bc4ee4ca107f8a7bb62afc271273d975997632130a21a400819d9182a28e68309c814fcb908c2edcfd05ae2ff23209c4f24"
    "e13928d24f652f27b97590512051bf19937f2964c5d92d43c9f3b77b89bb846725c2172e15c532d422a27aa52c7f02d70549f5a524f5ea7b46b4824a16b07d12"
)

prepare() {
    cd "${srcdir}"/${pkgname}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}"/${pkgname}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS=
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}"/${pkgname}-${_tag}
    install -Dm 0755 \
        "target/release/martin" \
        "${pkgdir}/usr/bin/martin"
    install -Dm 0755 \
        "target/release/martin-cp" \
        "${pkgdir}/usr/bin/martin-cp"
    install -Dm 0644 \
        "README.md" \
        "${pkgdir}/usr/share/docs/${pkgname}/README.md"

    cd "${srcdir}"
    install -Dm 0644 \
        "${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 0644 \
        "${pkgname}.sysusers.d" \
        "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 0644 \
        "${pkgname}-config.yaml" \
        "${pkgdir}/etc/${pkgname}/config.yaml"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
