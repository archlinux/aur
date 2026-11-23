# Maintainer: Donovan Tjemmes <mdtjemmes@proton.me>

pkgname=termeric-git
_pkgname=termeric
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator themed around roots and rhizomes"
arch=('x86_64' 'aarch64')
url="https://github.com/Tjemmmic/termeric"
# Termeric is MIT. The rest covers what the binary includes, as listed in the
# shipped THIRD_PARTY_NOTICES.md: the Rust crates, the guest themes' colors
# (MIT), the Unicode CLDR data, and the bundled libgit2 (GPL-2.0 with its linking exception), its xdiff (LGPL),
# and its PCRE2 (BSD-3-Clause with the PCRE2 exception).
license=(
  'MIT'
  '0BSD'
  'Apache-2.0'
  'BSD-2-Clause'
  'BSD-3-Clause'
  'BSD-3-Clause WITH PCRE2-exception'
  'CC0-1.0'
  'GPL-2.0-only WITH GCC-exception-2.0'
  'ISC'
  'LGPL-2.1-or-later'
  'MPL-2.0'
  'Unicode-3.0'
  'Unicode-DFS-2016'
  'Zlib'
)
# The binary links only glibc, libgcc_s, and zlib. winit, wgpu, and xkbcommon
# load the windowing, keyboard, and graphics libraries at runtime, so makepkg
# can't find them and they are listed by hand. ttf-font supplies a monospace
# font; Termeric bundles none.
depends=(
  'fontconfig'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'ttf-font'
  'vulkan-icd-loader'
  'wayland'
  'zlib'
)
makedepends=('cargo' 'git' 'ncurses' 'pkgconf' 'python')
optdepends=(
  'vulkan-driver: Vulkan rendering (vulkan-radeon, vulkan-intel, nvidia-utils, or vulkan-swrast for the CPU fallback)'
  'mesa: OpenGL backend and llvmpipe software rendering'
)
provides=('termeric')
conflicts=('termeric')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
# Current Rust links x86_64 Linux binaries with rust-lld. Arch's global GCC LTO
# flags produce bundled libgit2 objects that rust-lld cannot consume, so keep
# Cargo's own release optimization while disabling makepkg's cross-language LTO.
options=('!debug' '!lto')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local base revision short
  base="$(sed -nE 's/^version = "([^"]+)"/\1/p' Cargo.toml | head -n1)"
  revision="$(git rev-list --count HEAD)"
  short="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s' "${base}" "${revision}" "${short}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CARGO_TARGET_DIR="${srcdir}/target" cargo build \
    --workspace --release --locked
}

# The suite CI runs. It needs no display, GPU, network, session bus, or
# installed fonts, so it can run in a clean chroot.
check() {
  cd "${srcdir}/${_pkgname}"
  CARGO_TARGET_DIR="${srcdir}/target" cargo test \
    --workspace --locked
}

# The same install tree the tarball and .deb ship, staged by the repository's
# script and installed with its install.sh.
package() {
  cd "${srcdir}/${_pkgname}"

  rm -rf "${srcdir}/install-tree"
  python scripts/stage_install_tree.py \
    --binary "${srcdir}/target/release/termeric" --out "${srcdir}/install-tree"
  sh "${srcdir}/install-tree/install.sh" --prefix /usr --destdir "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
