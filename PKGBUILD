# Maintainer: Simone Camito <zibo.camito@gmail.com>

pkgname=ashell
pkgver=0.12.1
pkgrel=1
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
url="https://github.com/MalpenZibo/${pkgname}"
license=("GPL-3.0-or-later")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
makedepends=(
  "cargo"
  "git"
  "wayland-protocols"
  "clang"
)
depends=(
  "libxkbcommon"
  "wayland"
  "dbus"
  "libpipewire"
  "libpulse"
)
optdepends=(
  "cava: audio visualizer in the media player module"
)
arch=("x86_64" "aarch64")
options=(!lto)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.service"
)
sha512sums=(
  '9cfebff5255d5eb688d69213361f6123f5c02274e6271e9c4ff337eb4862db9d3d099b2fcf8c4d03def57a188a1615c50308195cc68d2da64caa1d1b87008488'
  'd66d30f7ce7d3d8b8c0fbba35f1d6723abaa881b6a91a335b18d557ee1eb6f6d56abc40de3c7dc08af4385b2d99e7068f4acecb40e579ff355d18352a0c051a1'
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
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
