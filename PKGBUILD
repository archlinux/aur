# Maintainer: Donovan Tjemmes <mdtjemmes@proton.me>

pkgname=termeric-bin
_pkgname=termeric
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator themed around roots and rhizomes (prebuilt)"
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
optdepends=(
  'vulkan-driver: Vulkan rendering (vulkan-radeon, vulkan-intel, nvidia-utils, or vulkan-swrast for the CPU fallback)'
  'mesa: OpenGL backend and llvmpipe software rendering'
)
provides=('termeric')
conflicts=('termeric')
# The release's tarball: the install tree the release workflow built and
# attested, the same one the termeric package stages from source.
source_x86_64=("${_pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-linux.tar.gz")
# Pinned from the release's SHA256SUMS by the publish workflow in the copy it
# pushes to the AUR (PACKAGING.md); makepkg rejects these placeholders.
sha256sums_x86_64=('d5887a79206939423a550ffd7761f0ef6feb8f913142b0d249dcd7f865c7d9c5')
sha256sums_aarch64=('7774d0aeae820b8fa4b4db5a3e6eba76bf9328067a1cf7fbc5633d76f50fe598')
# The binary is already stripped, and has no debug information to split.
options=('!debug' '!strip')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-linux"
  sh install.sh --prefix /usr --destdir "${pkgdir}"
  install -Dm644 share/doc/termeric/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
