# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-gallery
pkgver=0.7.0
pkgrel=1
pkgdesc="Unofficial Proton Photos and Drive gallery with a native photo and video viewer"
arch=('x86_64')
url="https://github.com/narrrl/proton-gallery"
_repo="https://github.com/narrrl/proton-gallery"
license=('MIT')
depends=('dbus' 'polkit' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland' 'libglvnd'
         'vulkan-icd-loader' 'hicolor-icon-theme' 'xdg-utils' 'ca-certificates'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav'
         'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'ttf-dejavu: fallback fonts for the desktop interface'
            'gst-plugin-va: hardware video decoding'
            'gst-plugins-ugly: older video formats')
conflicts=('proton-gallery-bin' 'proton-gallery-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz"
        "basemap-v1.pmtiles::https://github.com/narrrl/proton-rs/releases/download/basemap-v1/basemap-v1.pmtiles")
sha256sums=('a7f22972663cd2a41d3c10d0ef93bb36ce3d0ba253d556e89511cf060374ebb1'
            'ce9acab1b7ed7f15b23e2365b1b6a580db79f4bc4421851ee673eff4c920d280')
_srcname="proton-gallery-$pkgver"

prepare() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  # packaging/install.sh takes the Places basemap from data/.
  install -Dm644 "$srcdir/basemap-v1.pmtiles" data/basemap-v1.pmtiles
}

build() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pg-desktop --bin proton-gallery
}

check() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_srcname"
  bash packaging/install.sh "$pkgdir" target/release/proton-gallery
  if [[ $pkgname != proton-gallery ]]; then
    mv "$pkgdir/usr/share/licenses/proton-gallery" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
