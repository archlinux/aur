# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-gallery-git
pkgver=0.7.0.r0.g8fb4aad
pkgrel=1
pkgdesc="Unofficial Proton Photos and Drive gallery with a native photo and video viewer (git main)"
arch=('x86_64')
url="https://github.com/narrrl/proton-gallery"
_repo="https://github.com/narrrl/proton-gallery"
license=('MIT')
depends=('dbus' 'polkit' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland' 'libglvnd'
         'vulkan-icd-loader' 'hicolor-icon-theme' 'xdg-utils' 'ca-certificates'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav'
         'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'ttf-dejavu: fallback fonts for the desktop interface'
            'gst-plugin-va: hardware video decoding'
            'gst-plugins-ugly: older video formats')
provides=("${pkgname%-git}=$pkgver")
conflicts=('proton-gallery' 'proton-gallery-bin')
options=('!lto')
source=("$pkgname::git+$_repo.git"
        "basemap-v1.pmtiles::https://github.com/narrrl/proton-rs/releases/download/basemap-v1/basemap-v1.pmtiles")
sha256sums=('SKIP'
            'ce9acab1b7ed7f15b23e2365b1b6a580db79f4bc4421851ee673eff4c920d280')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  # packaging/install.sh takes the Places basemap from data/.
  install -Dm644 "$srcdir/basemap-v1.pmtiles" data/basemap-v1.pmtiles
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pg-desktop --bin proton-gallery
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname"
  bash packaging/install.sh "$pkgdir" target/release/proton-gallery
  if [[ $pkgname != proton-gallery ]]; then
    mv "$pkgdir/usr/share/licenses/proton-gallery" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
