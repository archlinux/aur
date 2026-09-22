# Maintainer: Taha YVR <https://github.com/tahayvr>

_pkgbase=omarchist
pkgname=${_pkgbase}-git
pkgver=r457.813e0df
pkgrel=1
pkgdesc="A GUI app for Omarchy Linux (development build from the dev branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('Apache-2.0')
# The cc crate compiles tree-sitter, curl and the Wayland trampoline with
# makepkg's CFLAGS; gcc LTO objects cannot be consumed by a clang link.
options=(!lto)

depends=(
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
    'vulkan-icd-loader'
    'vulkan-driver'
    'fontconfig'
    'freetype2'
    'openssl'
    'zstd'
    'hicolor-icon-theme'
    'desktop-file-utils'
    'gtk-update-icon-cache'
)
makedepends=('git' 'cargo' 'pkgconf')
install=${pkgname}.install
provides=("${_pkgbase}")
conflicts=("${_pkgbase}-bin" "${_pkgbase}")
source=("${pkgname}::git+$url.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/omarchist "${pkgdir}/usr/bin/omarchist"
  install -Dm644 omarchist.desktop        "${pkgdir}/usr/share/applications/omarchist.desktop"
  install -Dm644 assets/logo/omarchist.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/omarchist.png"
  install -Dm644 README.md                "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
