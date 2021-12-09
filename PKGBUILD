# Maintainer: James Devlin <devlin.ja@northeastern.edu>

pkgname=bustd
pkgver=0.1.0
pkgrel=1
pkgdesc="Process Killer Daemon for Out-of-Memory Scenarios, written in Rust"
groups=("bustd")

arch=("x86_64")
license=("MIT")
url="https://github.com/vrmiguel/bustd"
source=("${pkgname}::git+${url}" "${pkgname}.service")
provides=("bustd")
conflicts=("bustd")
sha1sums=("SKIP" "0ed07411677251c1f26d8a482f898b1d49807730")

depends=("gcc-libs")
makedepends=("cargo" "git")
conflicts=("oomd")
optdepends=("bustd-pacman-hooks: restart executable after pacman transaction")

# Fetches the libraries required via 'cargo'.
# (The rest of the build process may be run offline.)
prepare() {
  if [[ -z $RUSTUP_TOOLCHAIN ]]; then
    export RUSTUP_TOOLCHAIN=stable
  fi
  cd "${pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

# Compiles the package with all optimizations and features.
build() {
  if [[ -z $RUSTUP_TOOLCHAIN ]]; then
    export RUSTUP_TOOLCHAIN=stable
  fi
  export CARGO_TARGET_DIR=target
  cd "${pkgname}"
  cargo build --release --all-features --frozen
}

# Optional routine, which lints the code as a faster checking-mechanism prior to
# compiling it.
check() {
  if [[ -z $RUSTUP_TOOLCHAIN ]]; then
    export RUSTUP_TOOLCHAIN=stable
  fi
  cd "${pkgname}"
  cargo check --release --all-features --frozen
}

# Installs the binary and associated metadata to the system.
package() {
  # Binary Executable
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${pkgname}/target/release/${pkgname}"

  # Package License
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgname}/LICENSE"

  # Documentation (README)
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgname}/README.md"

  # Systemd Service
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" \
    "${pkgname}.service"
}
