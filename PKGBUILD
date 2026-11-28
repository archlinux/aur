# Maintainer: daguo <dgxz99@users.noreply.github.com>

pkgname=pinshot
pkgver=0.2.0
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
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "ppocrv5-mobile-det.onnx::https://huggingface.co/PaddlePaddle/PP-OCRv5_mobile_det_onnx/resolve/main/inference.onnx"
  "ppocrv5-mobile-det.yml::https://huggingface.co/PaddlePaddle/PP-OCRv5_mobile_det_onnx/resolve/main/inference.yml"
  "ppocrv5-mobile-rec.onnx::https://huggingface.co/PaddlePaddle/PP-OCRv5_mobile_rec_onnx/resolve/main/inference.onnx"
  "ppocrv5-mobile-rec.yml::https://huggingface.co/PaddlePaddle/PP-OCRv5_mobile_rec_onnx/resolve/main/inference.yml"
)
sha256sums=(
  '2eaf163eee37b1d68bed24c6301ec9c6ccf5bdbe653e40d92c654b5f47f419b5'
  'a431985659dc921974177a95adcfbb90fd9e51989a5e04d70d0b75f597b6e61d'
  '98069072e1b6b37d727fd9d9f11725faa46d6ea0de012f2ed26caea011c37699'
  'da72dc72ca4dc220df0dfde68c1dedc31c58d3e76a25871122e5056227d50092'
  '5dfeb2777f6d0db8177d8128a8acfcf6e6276dc4ac73ea3bf0dc06d6a5e85d8e'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pinshot-cli --features longshot,ocr
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

  install -Dm644 "${srcdir}/ppocrv5-mobile-det.onnx" \
    "${pkgdir}/usr/share/pinshot/ocr/ppocrv5-mobile/det/inference.onnx"
  install -Dm644 "${srcdir}/ppocrv5-mobile-det.yml" \
    "${pkgdir}/usr/share/pinshot/ocr/ppocrv5-mobile/det/inference.yml"
  install -Dm644 "${srcdir}/ppocrv5-mobile-rec.onnx" \
    "${pkgdir}/usr/share/pinshot/ocr/ppocrv5-mobile/rec/inference.onnx"
  install -Dm644 "${srcdir}/ppocrv5-mobile-rec.yml" \
    "${pkgdir}/usr/share/pinshot/ocr/ppocrv5-mobile/rec/inference.yml"

  install -Dm644 data/io.github.dgxz99.pinshot.desktop \
    "${pkgdir}/usr/share/applications/io.github.dgxz99.pinshot.desktop"
  install -Dm644 extensions/pinshot@dgxz99/icons/pinshot.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
