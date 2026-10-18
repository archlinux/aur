# Maintainer: Supun Sasanka <asce4s@gmail.com>
pkgname=lightbox-git
pkgver=r79.8cbf9b4
pkgrel=2
pkgdesc="Local-first photo manager and non-destructive editor"
arch=('x86_64')
url="https://github.com/asce4s/lightbox"
license=('MIT')
depends=(
  'gcc-libs'
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
  'libxcb'
  'libx11'
  'vulkan-icd-loader'
  'hicolor-icon-theme'
)
makedepends=(
  'rustup'
  'clang'
  'git'
  'pkgconf'
  'vulkan-headers'
)
optdepends=('ffmpeg: video thumbnails and metadata')
provides=('lightbox')
conflicts=('lightbox')
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

_toolchain() {
  awk -F'"' '/^channel / { print $2 }' rust-toolchain.toml
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname}"
  local toolchain
  toolchain="$(_toolchain)"
  rustup toolchain install "${toolchain}" --profile minimal --no-self-update
  rustup run "${toolchain}" cargo fetch --locked --target "$(rustup run "${toolchain}" rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export CARGO_TARGET_DIR=target
  rustup run "$(_toolchain)" cargo build --frozen --release -p lightbox -p lb-cli
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/lightbox "${pkgdir}/usr/bin/lightbox"
  install -Dm755 target/release/lightbox-cli "${pkgdir}/usr/bin/lightbox-cli"
  install -Dm644 assets/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lightbox.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/lightbox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Lightbox
Comment=Photo manager
Exec=lightbox
Icon=lightbox
Categories=Graphics;Photography;Viewer;
Terminal=false
EOF
}
