# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=lighthouse-ethereum
pkgver=8.2.2
_pkgname=lighthouse
pkgrel=1
pkgdesc='Ethereum consensus client in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/sigp/lighthouse'
license=('Apache-2.0')
# !lto: makepkg LTOFLAGS → cc-rs static archives → bad links with our rustc linker wrapper.
# Wrapper (lighthouse-link-gcc.sh): strip gc-sections/as-needed from rsp, force lld + --no-gc-sections.
options=('!lto')
conflicts=('lighthouse-ethereum-bin' 'lighthouse-bin')

depends=('openssl' 'sqlite' 'zstd')
makedepends=('cargo' 'cmake' 'clang' 'lld' 'protobuf' 'make' 'git' 'pkgconf')
source=(
  "git+https://github.com/sigp/lighthouse.git#tag=v$pkgver"
  "xdelta3-rs::git+https://github.com/sigp/xdelta3-rs.git"
  "lighthouse-link-gcc.sh"
  "validator_registration.json::https://raw.githubusercontent.com/ethereum/eth2.0-specs/v0.12.1/deposit_contract/contracts/validator_registration.json"
  "unsafe_validator_registration.json::https://raw.githubusercontent.com/sigp/unsafe-eth2-deposit-contract/v0.9.2.1/unsafe_validator_registration.json"
)
sha256sums=('e167c60f1bb3f388486c89d9768734ba9837a292aca0fa360f44e919c03a3074'
            'SKIP'
            'bdcc56b10425e5e280d60f26a579b2f8ccc8c40fa88480922ee992f6cacbabd2'
            '66c9407b5c249a483c4ee6bf0269847c19a3a8c55c1888981f08be5acb04c1af'
            '69e4de1d14f742dc4145234c0884c85a6c7cf6f1ada31d8ecd27dff2f67e4586')

prepare() {
    cd "${srcdir}/xdelta3-rs" || { echo 'prepare(): missing xdelta3-rs' >&2; return 1; }
    git submodule update --init --recursive || { echo 'prepare(): xdelta3-rs submodules' >&2; return 1; }

    cd "${srcdir}/${_pkgname}"
    if ! grep -q '^\[patch\."https://github.com/sigp/xdelta3-rs"\]$' Cargo.toml; then
        cat >> Cargo.toml <<'EOF'

[patch."https://github.com/sigp/xdelta3-rs"]
xdelta3 = { path = "../xdelta3-rs" }
EOF
    fi

    sed -i 's/^rusqlite = { version = "0.38", features = \["bundled"\] }$/rusqlite = { version = "0.38" }/' Cargo.toml
    grep -Fxq 'rusqlite = { version = "0.38" }' Cargo.toml \
      || { echo 'prepare(): rusqlite unbundle failed' >&2; return 1; }

    chmod +x "${srcdir}/lighthouse-link-gcc.sh"
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CARGO_INCREMENTAL=0
    export CARGO_HOME="${srcdir}/cargo-home"
    export CARGO_INSTALL_ROOT="${srcdir}/cargo-install"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export OPENSSL_NO_VENDOR=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    # portable: BLST portable; omit sysmalloc so default jemalloc is used (see lighthouse --version).
    export FEATURES=portable
    case "${CARCH}" in
        aarch64) export JEMALLOC_SYS_WITH_LG_PAGE=16 ;; # 64 KiB pages on some arm64 hosts
    esac

    export RUSTFLAGS="${RUSTFLAGS:-} -C linker=gcc -C link-arg=-fuse-ld=lld -C link-arg=-Wl,--no-gc-sections -C link-arg=-Wl,--no-as-needed -C link-arg=-lzstd"

    export LIGHTHOUSE_DEPOSIT_CONTRACT_SPEC_URL="file://$(realpath "${srcdir}/validator_registration.json")"
    export LIGHTHOUSE_DEPOSIT_CONTRACT_TESTNET_URL="file://$(realpath "${srcdir}/unsafe_validator_registration.json")"

    PROFILE=maxperf make
}

package() {
    install -D -m755 "${srcdir}/cargo-install/bin/lighthouse" "${pkgdir}/usr/bin/lighthouse"
    install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
