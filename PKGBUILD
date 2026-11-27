# Maintainer: daguo <dgxz99@users.noreply.github.com>

pkgname=pinshot
pkgver=0.1.1
pkgrel=1
pkgdesc='Lightweight Wayland screenshot, screen-pinning, scrolling capture and GIF tool for GNOME Shell'
arch=('x86_64')
url='https://github.com/dgxz99/pinshot'
license=('MIT')
depends=(
  'gnome-shell'
  'wl-clipboard'
  'pango'
  'xdg-desktop-portal-gnome'
  'pipewire'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugin-pipewire'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'glib2'
  'pkgconf'
)
checkdepends=(
  'ttf-dejavu'
)
optdepends=(
  'satty: annotate screenshots and pins'
  'libnotify: desktop notifications'
)
conflicts=('pinshot-bin' 'pinshot-git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2b229d6bae79d0ea931eb8d309c05980b19893dc204378f061feae3d84d56c8')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pinshot-cli --features longshot
  glib-compile-schemas --strict extensions/pinshot@dgxz99/schemas
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/pinshot "${pkgdir}/usr/bin/pinshot"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r extensions/pinshot@dgxz99 "${pkgdir}/usr/share/gnome-shell/extensions/pinshot@dgxz99"

  install -Dm644 data/io.github.dgxz99.pinshot.desktop \
    "${pkgdir}/usr/share/applications/io.github.dgxz99.pinshot.desktop"
  install -Dm644 extensions/pinshot@dgxz99/icons/pinshot.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
