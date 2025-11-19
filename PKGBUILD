# Maintainer: peippo <christoph.fink@gmail.com>

pkgbase=martin
pkgname=("martin" "martin-cp")

pkgdesc="A tile server able to generate and serve vector tiles on the fly"
url="https://maplibre.org/martin/"

_git_organisation=maplibre

pkgver=1.0.0
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
backup=("etc/martin/config.yaml")

source=(
    "${pkgbase}-${pkgver}.tar.gz::https://github.com/${_git_organisation}/${pkgbase}/archive/refs/tags/${_tag}.tar.gz"
    "${pkgbase}-${pkgver}-LICENSE-APACHE::https://github.com/${_git_organisation}/${pkgbase}/raw/refs/tags/${_tag}/LICENSE-APACHE"
    "${pkgbase}-${pkgver}-LICENSE-MIT::https://github.com/${_git_organisation}/${pkgbase}/raw/refs/tags/${_tag}/LICENSE-MIT"
    "martin.service"
    "martin.sysusers.d"
    "martin-config.yaml"
)
b2sums=(
    "1e0887a22e2f57d7022d8eeb8b7c3c86564bc5975add06df1ffc08e73807c70f70c6f99e8c237756fb5cf490d89e6e2749192a081a6c72674f0cb628d0c10704"
    "cb5ba44d3653218aa76bc8b1d7c1d26b3a72dd35da7490d430a5dda727e9750015c28206d8d7e7c29701dd0c3d24198ff159f2566aff72f9f6edb1f493c0a968"
    "fc19c34e958648930a8d8cc56542ffd8eabdea36954d61e9e2f8c6b7f48bef66a61233c5097a5b4f40b79321bfb16b8ef445de0460af115413f7fd3dea825bc9"
    "c3b79402f4ae27fd46915e5aab9efb7722ccc2c1d37155119c32e59fce695b784b98bf83aa46e80f6a83756850b8794ee0752eaebd9a9001d48b0f4d5ae791ca"
    "24e80b2adf58036276b6026e41914bc4ee4ca107f8a7bb62afc271273d975997632130a21a400819d9182a28e68309c814fcb908c2edcfd05ae2ff23209c4f24"
    "e13928d24f652f27b97590512051bf19937f2964c5d92d43c9f3b77b89bb846725c2172e15c532d422a27aa52c7f02d70549f5a524f5ea7b46b4824a16b07d12"
)

prepare() {
    cd "${srcdir}"/${pkgbase}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}"/${pkgbase}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS=
    cargo build --frozen --release --all-features --package martin
}

# check() {
#     cd "${srcdir}"/${pkgbase}-${_tag}
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test \
#         --frozen \
#         --all-features \
#         --package martin \
#         --no-fail-fast \
#         -- \
#             --skip function_source_ \
#             --skip pg_server_test \
#             --skip pg_table_source_test \
#             --skip styles_server_test
#             # --skip table_ \
#             # --skip tables_ \
#             # --skip pmt_ \
#             # --skip "tiles::postgres" \
#             # --skip "render_tests::" \
#             # --skip "tiles::cog::source::tests::can_get_full_resolution"
# }

package_martin() {
    cd "${srcdir}"/${pkgbase}-${_tag}
    install -Dm 0755 \
        "target/release/martin" \
        "${pkgdir}/usr/bin/martin"
    install -Dm 0644 \
        "README.md" \
        "${pkgdir}/usr/share/docs/martin/README.md"

    cd "${srcdir}"
    install -Dm 0644 \
        "${pkgbase}.service" \
        "${pkgdir}/usr/lib/systemd/system/martin.service"
    install -Dm 0644 \
        "${pkgbase}.sysusers.d" \
        "${pkgdir}/usr/lib/sysusers.d/martin.conf"
    install -Dm 0644 \
        "${pkgbase}-config.yaml" \
        "${pkgdir}/etc/martin/config.yaml"
    install -Dm 0644 \
        "${pkgbase}-${pkgver}-LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/martin/LICENSE-APACHE"
    install -Dm 0644 \
        "${pkgbase}-${pkgver}-LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/martin/LICENSE-MIT"
}

package_martin-cp() {
    pkgdesc="Generate vector map tiles in bulk"
    url="https://maplibre.org/martin/martin-cp.html"

    cd "${srcdir}"/${pkgbase}-${_tag}
    install -Dm 0755 \
        "target/release/martin-cp" \
        "${pkgdir}/usr/bin/martin-cp"
}
