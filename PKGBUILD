# Maintainer: novica <nnovica@gmail.com>

pkgname=emaki
pkgver=0.4.1 # renovate: datasource=github-releases depName=alkaline-software/emaki
pkgrel=1
pkgdesc="An agentic development environment"
url="https://github.com/alkaline-software/emaki"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    glibc
    libgcc
    libxcb
    libxkbcommon
    libxkbcommon-x11
    fontconfig
    freetype2
    wayland
    vulkan-icd-loader
    hicolor-icon-theme
)
conflicts=('emaki-bin')
optdepends=('xdg-desktop-portal: file picker and secret storage')
makedepends=('rust' 'git' 'clang' 'cmake')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alkaline-software/emaki/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked -p emaki-app
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 target/release/Emaki "${pkgdir}/usr/bin/Emaki"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/Emaki.desktop" <<EOF
[Desktop Entry]
Categories=Development;
Comment=Every coding-agent session on this machine, kept for good, in one window you can also talk to.
Exec=Emaki
Icon=Emaki
Name=Emaki
Terminal=false
Type=Application
EOF
  for size in 32 128 256 512 1024; do
    install -Dm644 "crates/emaki-app/assets/icon/icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/Emaki.png"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('1e1b6b1ac9d07f649f15f553c7c770a8309be543f9450f8a9e49ae1da56790faf9e00a8f86dbb3bf765b48f7ff8978d3af3aa1b865ee4bcdbcfae638bd815e06')
