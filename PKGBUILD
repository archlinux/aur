# Maintainer: EmIsGreat <monsoon-package@gemderbent.dev>

pkgname="monsoon-emulator"
pkgver=0.2.10
pkgrel=2
pkgdesc="A work-in-progress NES emulator"
arch=('x86_64')
url="https://github.com/EmIsGreat/Monsoon-Emulator"
license=('Apache-2.0')

options=(
    '!lto'
    '!debug'
)

conflicts=('monsoon-emulator-bin')

depends=(
    'glibc'
    'gcc-libs'
)

_cli_pkg_ver="0.2.9"

makedepends=(cargo-nightly)

source=(
    "${pkgname}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "${pkgname}-${_cli_pkg_ver}.tar.gz::$url/archive/refs/tags/v${_cli_pkg_ver}.tar.gz"
    "https://raw.githubusercontent.com/EmIsGreat/Monsoon-Emulator/v$pkgver/LICENSE"
    "monsoon.desktop"
)

b2sums=('6b0f4184520eb8629c37f23fe039ee62c1b26038d482ac891b39c10eebe4135da2c0408dfe55b0dc3b95442dd044022366d2e242165f8707c179b4f43cb255be'
        'ccb4af097bb8e5466b364db6711ad713c3ca473beacb417561950640568c4bc53a535921bc4783373646439d7c4b83b80d74c100f20048b4f02458480be9ac20'
        '40b4641424fe7d53369c27edd05f1dba3380b32917d0e2464862e2d1a44ea1768810e65eb392274205ac95b9d10f9867f63258aab28d0bf6ceb4bf98b880b991'
        'b86f0d4bbc9a53b0acfb27b66804e85dcc18a38ba5d3cf896edf7116230553907d85b732f18bf8864d6a8e7b6a85d63022ee630f6099e06c9263ce896f56ead5')

prepare() {
    cd "Monsoon-Emulator-$pkgver"
    cargo fetch --locked --target host-tuple

    cd "../Monsoon-Emulator-${_cli_pkg_ver}"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "Monsoon-Emulator-$pkgver"

    export CARGO_TARGET_DIR=target
    cargo build --frozen --profile full_release -p monsoon-frontend

    cd "../Monsoon-Emulator-${_cli_pkg_ver}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --profile full_release -p monsoon-cli
}

package() {
	mv "Monsoon-Emulator-${_cli_pkg_ver}/target/full_release/cli" "Monsoon-Emulator-${_cli_pkg_ver}/target/full_release/${pkgname%-emulator}-cli"
	mv "Monsoon-Emulator-${pkgver}/target/full_release/frontend" "Monsoon-Emulator-${pkgver}/target/full_release/${pkgname%-emulator}-frontend"

    install -Dm0755 -t "$pkgdir/usr/bin/" "Monsoon-Emulator-${_cli_pkg_ver}/target/full_release/${pkgname%-emulator}-cli"
    install -Dm0755 -t "$pkgdir/usr/bin/" "Monsoon-Emulator-${pkgver}/target/full_release/${pkgname%-emulator}-frontend"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/monsoon.desktop" "$pkgdir/usr/share/applications/monsoon.desktop"
}
