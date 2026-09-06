# Maintainer: PenguinBurner contributors

pkgname=penguin-burner
pkgver=0.8.0
pkgrel=1
pkgdesc='NVIDIA GPU automatic undervolting and fine tuning tool'
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
  export PENGUIN_BURNER_REQUIRE_NATIVE_LAYER=1
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

  # Arch's rust 1.98 bakes the triple-prefixed x86_64-linux-gnu-gcc in as the
  # default linker; the matching symlink only ships with gcc 16.2.1+r23. On
  # hosts whose gcc predates it (partial upgrades, lagging derivatives) cargo
  # cannot exec the linker, so fall back to plain gcc there.
  if ! command -v x86_64-linux-gnu-gcc >/dev/null 2>&1; then
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  fi
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
