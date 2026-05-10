# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=lighthouse-ethereum
pkgver=8.1.3
_pkgname=lighthouse
pkgrel=40
pkgdesc='Ethereum consensus client in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/sigp/lighthouse'
license=('Apache License 2.0')
# !lto: makepkg LTOFLAGS → cc-rs static archives → bad links with our rustc linker wrapper.
# Wrapper (lighthouse-link-gcc.sh): strip gc-sections/as-needed from rsp, force lld + --no-gc-sections.
options=('!lto')

depends=('openssl' 'sqlite' 'zstd')
makedepends=('cargo' 'cmake' 'clang' 'lld' 'protobuf' 'make' 'git' 'perl' 'pkgconf')
source=(
  "git+https://github.com/sigp/lighthouse.git#tag=v$pkgver"
  "xdelta3-rs::git+https://github.com/sigp/xdelta3-rs.git"
  "deposit_contract-offline.patch"
  "lighthouse-link-gcc.sh"
  "validator_registration.json::https://raw.githubusercontent.com/ethereum/eth2.0-specs/v0.12.1/deposit_contract/contracts/validator_registration.json"
  "unsafe_validator_registration.json::https://raw.githubusercontent.com/sigp/unsafe-eth2-deposit-contract/v0.9.2.1/unsafe_validator_registration.json"
)
sha256sums=('7f193d7e545556348a63aab575afd9257ceea53ff29a755125fe02494d71b0d4'
            'SKIP'
            '70ca6431c139debdee9fe9339cddffdc2eaa37e85631e42f7bd913feeb18d8fd'
            '502a20a5bc2adbc49781f328f77233cce6ef08b405e40011c2d46283d9295921'
            '66c9407b5c249a483c4ee6bf0269847c19a3a8c55c1888981f08be5acb04c1af'
            '69e4de1d14f742dc4145234c0884c85a6c7cf6f1ada31d8ecd27dff2f67e4586')

prepare() {
    cd "${srcdir}/xdelta3-rs" || { echo 'prepare(): missing xdelta3-rs' >&2; return 1; }
    git submodule update --init --recursive || { echo 'prepare(): xdelta3-rs submodules' >&2; return 1; }

    perl -i -0777 -pe '
      s/\.allowlist_type\("xd3_\.\*"\)/.allowlist_type("_xd3_.*")\n            .allowlist_type("xd3_.*")/g;
      s/\.warnings\(false\)(\s*\n)(\s*)(\.compile\("xdelta3"\))/.warnings(false)\n$2.flag_if_supported("-Wno-stringop-overflow")$1$2$3/s;
    ' build.rs || { echo 'prepare(): xdelta3-rs build.rs patch failed' >&2; return 1; }
    grep -Fq '.allowlist_type("_xd3_.*")' build.rs \
      && grep -Fq 'flag_if_supported("-Wno-stringop-overflow")' build.rs \
      || { echo 'prepare(): xdelta3-rs build.rs verification failed' >&2; return 1; }

    cd "${srcdir}/${_pkgname}"
    if ! grep -q '^\[patch\."https://github.com/sigp/xdelta3-rs"\]$' Cargo.toml; then
        cat >> Cargo.toml <<'EOF'

[patch."https://github.com/sigp/xdelta3-rs"]
xdelta3 = { path = "../xdelta3-rs" }
EOF
    fi

    patch -Np1 -i "${srcdir}/deposit_contract-offline.patch"

    perl -i -pe 's/^rusqlite = \{ version = "0\.28", features = \["bundled"\] \}$/rusqlite = { version = "0.28" }/' Cargo.toml \
      || { echo 'prepare(): rusqlite patch failed' >&2; return 1; }
    grep -Fxq 'rusqlite = { version = "0.28" }' Cargo.toml \
      || { echo 'prepare(): rusqlite line missing' >&2; return 1; }

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
    export FEATURES=sysmalloc,portable

    export LIGHTHOUSE_REAL_GCC="/usr/bin/${CARCH}-linux-gnu-gcc"
    [[ -x "${LIGHTHOUSE_REAL_GCC}" ]] || export LIGHTHOUSE_REAL_GCC=/usr/bin/gcc

    _lw="${srcdir}/lighthouse-link-gcc.sh"
    [[ -x "${_lw}" ]] || { echo "build(): missing ${_lw}" >&2; return 1; }
    export RUSTFLAGS="${RUSTFLAGS:-} -C linker=${_lw} -C link-arg=-lzstd -C link-arg=-Wl,--no-gc-sections"

    export LIGHTHOUSE_DEPOSIT_CONTRACT_SPEC_URL="file://$(realpath "${srcdir}/validator_registration.json")"
    export LIGHTHOUSE_DEPOSIT_CONTRACT_TESTNET_URL="file://$(realpath "${srcdir}/unsafe_validator_registration.json")"

    if [[ -n "${MAKEFLAGS}" ]]; then
        _j="$(sed -n 's/.*-j\([0-9]\+\).*/\1/p' <<<"${MAKEFLAGS}")"
        [[ -n "${_j}" ]] && export CARGO_BUILD_JOBS="${_j}"
    fi

    PROFILE=maxperf make
}

package() {
    install -D -m755 "${srcdir}/cargo-install/bin/lighthouse" "${pkgdir}/usr/bin/lighthouse-ethereum"
    install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
