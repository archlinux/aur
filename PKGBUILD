# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=mgcarpet
pkgver=0.1.0alpha5
_tag="${pkgver/alpha/_alpha}"
pkgrel=1
pkgdesc='Engine reimplementation of Magic Carpet 1 & 2 (requires original game data)'
arch=('x86_64')
url="https://github.com/raincz/${pkgname}"
license=('GPL-3.0-or-later' 'LicenseRef-GeneralUser-GS')
depends=('alsa-lib'
         'gcc-libs'
         'glibc'
         'libglvnd'
         'libx11'
         'libxcursor'
         'libxi'
         'libxkbcommon-x11'
         'vulkan-icd-loader'
         'wayland')
makedepends=('cargo')
options=(!lto)  # GCC LTO objects of C dependencies (zstd-sys) are unreadable by lld, which Rust links with
source=("${pkgname}-${_tag}.tar.gz::https://github.com/raincz/${pkgname}/archive/v${_tag}.tar.gz"
        'mgcarpet'
        'mgcarpet.desktop'
        'mgcarpet-mc1.desktop'
        'mgcarpet-mc1hw.desktop'
        'mgcarpet-mc2.desktop')
sha512sums=('ebe418af5acb206af3c84556fa78225f95e86bcf1fb04903bc175161717414aa068bcdc391fa554403e036172cb418e22c73df33b86beb1b3009e3e70a3ab992'
            '6c8ce88583ef7c8c9859d07561d8addf197d2207792b075270d253f456eda5de2d714446821aa7ca31c48f6a78424f543471e556efa086396aba728b11840f12'
            'f505069e75f0f21d69fbf0703df4a0cc8c095865cf5feab14652c1f7e9ddbe64d1ea319d0680b38cc160b7dab1dfc5591a54b31d798705e507d63318bde99ced'
            '85cd9999174a5c0bbf6d6a8b0df88fb344182a32a463b0e9468f933f9bc28638dd3472f4e053fd607d63444ae7f58aee4e692f27936686925090a0706e5f9d4d'
            'd4777a58a9f8fee602a5ba0cb99689b0e7d55684ed7f21a586a0ee972891cb7931cfa7df35217b070d55b90b3c28e7328deccb9ba3ba08751d5969281d12adab'
            'c7a1964012f83fc2a5e10608c4fddf341c37696b22d2205aa5ad995bf735392313ed54d441aa6e88950a661eabc5db94b733b8a2a83f92ee5298b74d90042fab')

prepare() {
    cd "${pkgname}-${_tag}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${_tag}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --bin mgcarpet --bin mgc-import
}

check() {
    cd "${pkgname}-${_tag}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${_tag}"
    install -Dm 755 -t "${pkgdir}/usr/lib/${pkgname}" ./target/release/{mgcarpet,mgc-import}
    install -Dm 644 -t "${pkgdir}/usr/share/${pkgname}" ./assets/static/GeneralUser-GS.sf2
    ln -rs "${pkgdir}/usr/share/${pkgname}/GeneralUser-GS.sf2" "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/mgcarpet"
    ln -rs "${pkgdir}/usr/lib/${pkgname}/mgc-import" "${pkgdir}/usr/bin/"
    install -Dm 644 -t "${pkgdir}/usr/share/applications" "${srcdir}"/*.desktop
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 gamedata/README.md "${pkgdir}/usr/share/doc/${pkgname}/gamedata.md"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./assets/static/GeneralUser-GS-LICENSE.txt
}
