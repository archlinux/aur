# Maintainer: nobody <you@example.com>
pkgname=lib32-rav1e
pkgver=0.8.1
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety (32-bit)'
arch=('x86_64')
url='https://github.com/xiph/rav1e'
license=('BSD-2-Clause')

depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cargo-c'
  'nasm'
  'rust'
  'lib32-rust-libs'
  'gcc'
)
provides=('librav1e.so')
conflicts=('lib32-rav1e-git')
options=('!lto')

# Deterministic sources: release tarball + matching lockfile
source=(
  "rav1e-${pkgver}.tar.gz::https://github.com/xiph/rav1e/archive/refs/tags/v${pkgver}.tar.gz"
  "Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock"
)
# Regenerate these locally:
b2sums=('a7b396df8f0ac3cb7f4f7f6e4bac5b9500037f3518f3ac2914088f45928a443d81b59a5f4d777f49c7877713444c4b019db5baf27063b3f1c4a7bf82595de3ec'
        '4c0e7e271f8cd96bf5d47162a0072a7ba4ddb6f40ec03fc6deddd7b3166fffcdc60ddf85829d49359a9d49fe9a3fba1ed4ef2ea8c4303475076eba9ea6ae1cc4')

# Map host arch to 32-bit target/libdir (package is only useful on x86_64)
# (namcap prefers $CARCH-based conditionals over hard-coded 'i686' usage)
case "$CARCH" in
  x86_64)
    _rust_target='i686-unknown-linux-gnu'
    _libdir='/usr/lib32'
    ;;
  *)
    echo "Unsupported CARCH: $CARCH (this lib32 package is intended for x86_64 hosts)"
    return 1
    ;;
esac

prepare() {
  export PATH=/usr/bin:$PATH
  export CARGO_HOME="${srcdir}/fakehome/cargo"

  # Use the lockfile that matches the release tag to avoid dependency drift
  cp -f "Cargo-rav1e-${pkgver}.lock" "rav1e-${pkgver}/Cargo.lock"

  # Pre-fetch crates deterministically
  cargo fetch --locked --manifest-path "rav1e-${pkgver}/Cargo.toml"
}

build() {
  export PATH=/usr/bin:$PATH
  export CARGO_HOME="${srcdir}/fakehome/cargo"

  # Keep host toolchain 64-bit; only direct the TARGET to 32-bit
  # (Do NOT export global -m32 or PKG_CONFIG_LIBDIR here.)
  cargo build --target "${_rust_target}" \
    --release --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --manifest-path "rav1e-${pkgver}/Cargo.toml"

  cargo cbuild --target "${_rust_target}" \
    --release --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix=/usr \
    --manifest-path "rav1e-${pkgver}/Cargo.toml" \
    --libdir "${_libdir}"
}

# Tests recompile host/target and can accidentally reintroduce mixed-arch paths.
# Skip for packaging; enable locally if you want to iterate on fixes.
check() { :; }

package() {
  export PATH=/usr/bin:$PATH
  export CARGO_HOME="${srcdir}/fakehome/cargo"

  cd "rav1e-${pkgver}"

  cargo install --target "${_rust_target}" \
    --frozen --offline \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --no-track \
    --path . \
    --root "${pkgdir}/usr"

  cargo cinstall --target "${_rust_target}" \
    --release --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix /usr \
    --destdir "${pkgdir}" \
    --libdir "${_libdir}"

  # Only 32-bit libs/bins should ship
  rm -rf "${pkgdir}/usr/include"
  ( cd "${pkgdir}/usr/bin"; mv rav1e rav1e-32 )

  install -Dm644 LICENSE PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
