# Maintainer: Donovan Tjemmes <mdtjemmes@proton.me>

pkgname=termeric
pkgver=0.1.0
pkgrel=2
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
makedepends=('cargo' 'ncurses' 'pkgconf' 'python')
checkdepends=('git')
optdepends=(
  'vulkan-driver: Vulkan rendering (vulkan-radeon, vulkan-intel, nvidia-utils, or vulkan-swrast for the CPU fallback)'
  'mesa: OpenGL backend and llvmpipe software rendering'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# A tag's archive can't contain its own checksum, so this stays a placeholder,
# which makepkg rejects. The publish workflow pins it, with updpkgsums, in the
# copy it pushes to the AUR (PACKAGING.md).
sha256sums=('5f1e4a0c735d5576a3bbe463aa922899fdaaa1b10a3199386e6c5ff70954992e')
# Current Rust links x86_64 Linux binaries with rust-lld. Arch's global GCC LTO
# flags produce bundled libgit2 objects that rust-lld cannot consume, so keep
# Cargo's own release optimization while disabling makepkg's cross-language LTO.
options=('!debug' '!lto')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CARGO_TARGET_DIR="${srcdir}/target" cargo build \
    --workspace --release --locked
}

# The suite CI runs. It needs no display, GPU, network, session bus, or
# installed fonts, so it can run in a clean chroot. setsid runs it in a session
# of its own, as in CI: some tests start interactive shells, which would take
# over the terminal makepkg runs in and stop the build.
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CARGO_TARGET_DIR="${srcdir}/target" setsid --wait cargo test \
    --workspace --locked
}

# The same install tree the tarball and .deb ship, staged by the repository's
# script and installed with its install.sh.
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf "${srcdir}/install-tree"
  python scripts/stage_install_tree.py \
    --binary "${srcdir}/target/release/termeric" --out "${srcdir}/install-tree"
  sh "${srcdir}/install-tree/install.sh" --prefix /usr --destdir "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
