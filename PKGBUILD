# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Tux Burner is a fork of PenguinBurner by jpietek (GPL-3.0-or-later).
# Tux Burner is Copyright (C) 2026 by Eugene Flanagin. Licensed under GPL-3.0-or-later.
#
# Changes compared with upstream's packaging/arch/PKGBUILD (all marked here):
#   * pkgname tux-burner, provides/conflicts penguin-burner and penguin-burner-amd,
#     replaces penguin-burner-amd (the earlier local AMD port).
#   * source is GitHub's archive of a pinned commit of the Tux Burner repo; the program lives in its work/ folder.
#   * no NVAPI latency shim and no mingw-w64-gcc makedepend (NVIDIA/Windows only).
#   * AMD optdepends (OpenCL ICD, LACT, RADV); nothing providing libcuda is pulled in.
#   * tux-burner.install migrates /etc/penguin-burner and /var/lib/penguin-burner.

pkgname=tux-burner
pkgver=0.99
pkgrel=1
_commit=933335ecf3dad4a54efdab6323a38ab73f63ca1b
pkgdesc='GPU undervolting, overclocking, and per-game tuning (AMD and NVIDIA)'
arch=('x86_64')
url='https://github.com/eugenesflanagin-spec/tux-burner'
license=('GPL-3.0-or-later')
provides=('penguin-burner' 'penguin-burner-amd')
conflicts=('penguin-burner' 'penguin-burner-amd')
replaces=('penguin-burner-amd')
install=tux-burner.install
depends=(
  'bash'
  'hicolor-icon-theme'
  'pyside6>=6.7'
  'python'
  'python-colorama>=0.4'
  'python-pyqtgraph>=0.13'
  'python-yaml>=6.0'
  'hwdata'
  'ocl-icd'
)
optdepends=(
  'rocm-opencl-runtime: AMD OpenCL ICD for the --amd-stress / --amd-auto-uv workload (rusticl also works)'
  'lact: when lactd runs it owns GPU tuning; use --amd-export-lact to hand it a plan'
  'vulkan-radeon: RADV, needed by the Q2RTX stability benchmark'
)
makedepends=(
  'cargo'
  'cmake'
  'lib32-gcc-libs'
  'lib32-glibc'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'vulkan-headers'
)
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        'tux-burner.install')
sha256sums=('f04ff2931fd729410a6b28d0896963cc9d96eedc8c38bf6e81351640a5e1b342'
            '245090698f989b17681a9f3fcf6315c2b7818be7472b488a0b92e116fbd3654f')

build() {
  cd "${pkgname}-${_commit}/work"
  # The virtual cargo dependency can be supplied by rustup, whose proxy is not a
  # compiler. Bootstrap as the makepkg user, without replacing a default toolchain.
  if command -v rustup >/dev/null 2>&1 &&
      [[ "$(command -v cargo)" -ef "$(command -v rustup)" ]]; then
    export RUSTUP_TOOLCHAIN="${RUSTUP_TOOLCHAIN:-stable}"
    rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal --no-self-update
  fi
  cargo --version
  rustc --version
  if ! command -v x86_64-linux-gnu-gcc >/dev/null 2>&1; then
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  fi
  export TUX_BURNER_REQUIRE_DAEMON=1
  export TUX_BURNER_REQUIRE_NATIVE_LAYER=1
  export TUX_BURNER_REQUIRE_NATIVE_LAYER32=1
  # Tux Burner change: the Reflex/NVAPI marker shim is NVIDIA/Windows only.
  export TUX_BURNER_BUILD_NVAPI_SHIM=0
  python -m build --wheel --no-isolation --skip-dependency-check
  cargo build --release --locked --manifest-path burnerd/Cargo.toml
}

check() {
  cd "${pkgname}-${_commit}/work"
  # Pure parsers and the engine's AMD apply path, tested against captured OD text;
  # no GPU needed.
  cargo test --release --locked --manifest-path burnerd/Cargo.toml -- amd
}

package() {
  cd "${pkgname}-${_commit}/work"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm755 burnerd/target/release/tux-burnerd "${pkgdir}/usr/libexec/tux-burnerd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CREDITS.md "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 docs/amd.md "${pkgdir}/usr/share/doc/${pkgname}/amd.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  local f
  for f in docs/user-guide/*.md docs/user-guide/Tux-Burner-User-Guide.pdf docs/user-guide/Tux-Burner-User-Guide.html; do
    [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "$f")"
  done
  if [ -d docs/user-guide/images ]; then
    for f in docs/user-guide/images/*.png; do
      install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/images/$(basename "$f")"
    done
  fi
  install -Dm644 packaging/man/tburn-cli.1 "${pkgdir}/usr/share/man/man1/tburn-cli.1"
  ln -s tburn-cli.1 "${pkgdir}/usr/share/man/man1/tux-burner-cli.1"
  install -Dm644 packaging/man/tux-burner.1 "${pkgdir}/usr/share/man/man1/tux-burner.1"
  ln -s tux-burner.1 "${pkgdir}/usr/share/man/man1/tburn.1"
  install -Dm644 packaging/man/tux-burnerd.8 "${pkgdir}/usr/share/man/man8/tux-burnerd.8"
}
