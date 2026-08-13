# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=xr-passthrough-layer-git
pkgver=r38.e6c6008
pkgrel=1
pkgdesc="A OpenXR API layer adding camera passthrough support"
arch=('x86_64')
url="https://github.com/yshui/xr_passthrough_layer"
license=('MIT')
makedepends=(
  cargo
  git
)
source=(
  "xr-passthrough-layer::git+https://github.com/yshui/xr_passthrough_layer.git"
  "layer_manifest.json"
)
sha256sums=(
  'SKIP'
  '573331a74bb4454886400871eb262faac0f63344b7be6d11b5f48cc7c2cb6685'
)

pkgver() {
  cd "$srcdir/xr-passthrough-layer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd "$srcdir/xr-passthrough-layer"
  cargo build --release
}

package() {  
  install -d "$pkgdir/usr/lib/"
  install -m755 "$srcdir/xr-passthrough-layer/target/release/libxr_passthrough_layer.so" "$pkgdir/usr/lib/libxr_passthrough_layer.so"
  install -d "$pkgdir/usr/share/openxr/1/api_layers/implicit.d"
  install -m644 "$srcdir/layer_manifest.json" "$pkgdir/usr/share/openxr/1/api_layers/implicit.d/XR_APILAYER_YX_passthrough.json"
}
