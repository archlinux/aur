# Maintainer: Christopher D. Degawa <ccom@randomderp.com>
# Contributor: haxibami <contact at haxibami dot net>

pkgname=qdrant-git
_pkgname=qdrant
pkgver=1.16.2+r5061+gd2834de0b
pkgrel=2
pkgdesc="Vector Database and Vector Search Engine for AI"
backup=('etc/qdrant/config.yaml')
arch=('x86_64')
url="https://github.com/qdrant/qdrant"
license=('Apache')
depends=(
  'gcc-libs'
  'glibc'
  'jemalloc'
  'libunwind'
  'lz4'
  'rocksdb'
  'shaderc'
  'xz'
  'zstd'
)
makedepends=(
  'cargo'
  'cmake'
  'curl'
  'git'
  'mold'
  'pkgconf'
  'protobuf'
  'python'
  'rust-bindgen'
  'unzip'
)
checkdepends=('cargo-nextest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
  git+https://github.com/qdrant/qdrant.git
  0001-set-full-path-in-config.patch
  qdrant.service
  sysusers.conf
  tmpfiles.d
)
sha256sums=('SKIP'
            '6c40c64c69a72c44a4d01462887c8246f3459d29c8c3cc77108743d1b6a7b380'
            '505b121c76184ec1a18db7a9f6fc3c4019c0f7a46db21d32c5816ed5a043e714'
            '79493543ef27e8aad87e0241c1e2f4e964915e7b2f8aa08b17305ca1cfdc8d9e'
            'e6560fbe2767e95b6f022acfee0b4b00d7b0fef84bc29d71f80849c935c77eea')

export RUSTUP_TOOLCHAIN=stable
# Use mold linker for faster linking
export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }-C link-arg=-fuse-ld=mold"
export CARGO_TARGET_DIR=target

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Replace -march with specific flags for better compatibility with the default makepkg.conf
  sed -i 's/flag("-march=haswell");/flags(["-msse", "-mavx2"]);/' lib/quantization/build.rs
  # Apply custom patches
  patch -p1 -i "${srcdir}/0001-set-full-path-in-config.patch"
  # Fetch Rust dependencies
  cargo fetch --locked --target $(rustc --print host-tuple)
  # Fetch prebuilt web UI from https://github.com/qdrant/qdrant-web-ui
  [[ -d "static" ]] || ./tools/sync-web-ui.sh
}

build() {
  cd "${srcdir}/${_pkgname}"

  export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc.so
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export SHADERC_LIB_DIR=/usr/lib/
  cargo build --release --frozen --features=gpu,stacktrace,rocksdb --bin qdrant
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo nextest run --profile ci --frozen --features=gpu,stacktrace,rocksdb
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/qdrant"
  cp -a "static" "${pkgdir}/usr/share/qdrant/"
  install -Dm644 "config/config.yaml" "${pkgdir}/etc/qdrant/config.yaml"
  install -Dm644 "${srcdir}/${_pkgname}.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
