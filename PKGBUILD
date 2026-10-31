# Maintainer: PenguinBurner contributors

pkgname=penguin-burner
pkgver=0.8.4
pkgrel=1
pkgdesc='Automatic NVIDIA GPU undervolting, overclocking and adaptive per-game tuning'
arch=('x86_64')
url='https://github.com/jpietek/PenguinBurner'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'hicolor-icon-theme'
  'pyside6>=6.7'
  'python'
  'python-colorama>=0.4'
  'python-pyqtgraph>=0.13'
  'python-yaml>=6.0'
)
makedepends=(
  'cargo'
  'cmake'
  # The 32-bit companion Vulkan layer, which is the only thing a 32-bit game's
  # i386 winevulkan can load. Both live in [multilib] -- already enabled on any
  # machine that can run a 32-bit game at all, since its lib32 Vulkan driver
  # comes from there too.
  'lib32-gcc-libs'
  'lib32-glibc'
  'mingw-w64-gcc'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'vulkan-headers'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jpietek/PenguinBurner/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "PenguinBurner-${pkgver}"
  # The virtual cargo dependency can be supplied by rustup, whose proxy is
  # not a compiler. Bootstrap as the makepkg user, without replacing an
  # existing default toolchain; preserve an explicitly selected toolchain.
  if command -v rustup >/dev/null 2>&1 &&
      [[ "$(command -v cargo)" -ef "$(command -v rustup)" ]]; then
    export RUSTUP_TOOLCHAIN="${RUSTUP_TOOLCHAIN:-stable}"
    rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal --no-self-update
  fi
  cargo --version
  rustc --version

  # Both the wheel builder and the explicit daemon build below invoke Cargo.
  # Some Arch derivatives lack the triple-prefixed linker expected by rustc.
  if ! command -v x86_64-linux-gnu-gcc >/dev/null 2>&1; then
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  fi
  export PENGUIN_BURNER_REQUIRE_DAEMON=1
  export PENGUIN_BURNER_REQUIRE_NATIVE_LAYER=1
  # Fail the build rather than quietly shipping an overlay that never appears
  # in a 32-bit game; the lib32 makedepends above provide the toolchain.
  export PENGUIN_BURNER_REQUIRE_NATIVE_LAYER32=1
  # MinGW cross-compiles the NVAPI latency shim into the wheel; fail loudly
  # if the toolchain is missing instead of shipping the feature hollow.
  export PENGUIN_BURNER_REQUIRE_NVAPI_SHIM=1
  # CachyOS resolves the mingw-w64-gcc makedepend to llvm-mingw from its own
  # repo, which ships the same-named cross compilers off-PATH under
  # /opt/llvm-mingw. Surface them so the shim build finds a toolchain.
  if ! command -v x86_64-w64-mingw32-g++ >/dev/null 2>&1 &&
      [[ -x /opt/llvm-mingw/bin/x86_64-w64-mingw32-g++ ]]; then
    export PATH="/opt/llvm-mingw/bin:${PATH}"
  fi
  python -m build --wheel --no-isolation --skip-dependency-check

  # Root daemon: compiled from the bundled Rust crate in burnerd/. --locked
  # pins the committed Cargo.lock; crates.io is fetched during build() (makepkg
  # allows network there by default).
  cargo build --release --locked --manifest-path burnerd/Cargo.toml
}

package() {
  cd "PenguinBurner-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Package-owned source copied to the canonical /var/opt target at setup.
  install -Dm755 burnerd/target/release/penguin-burnerd \
    "${pkgdir}/usr/libexec/penguin-burnerd"
}
