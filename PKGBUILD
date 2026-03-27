# Maintainer: galister <galister-dev at pm dot me>

pkgname=wayvr
pkgver=26.2.1
pkgrel=2
pkgdesc="Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/wayvr-org/wayvr"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(glibc
         libxkbcommon
         libxkbcommon-x11
         hicolor-icon-theme
         libx11
         libstdc++
         libxcb
         openssl
         libxext
         libxrandr
         libgcc
         dbus
         libpipewire
         alsa-lib
         openxr
         openvr)
makedepends=(git
             cargo
             python3
             cmake
             clang
             shaderc)
replaces=("wlx-overlay-s")
conflicts=("$pkgname")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "0001-update-pipewire-rs-to-fix-build-on-arch.patch::${url}/commit/786847cc2f1d99010b6a7eb80e59941c6a58a3f2.patch"
        "0002-Updated-the-pipewire-reference-in-Cargo.lock.patch::${url}/commit/635df298fec63c610062fa362b6fb03268efa37a.patch")
sha256sums=('c81824f9a2855d01ac4c97165338cb24133febd17211b17aa302b8e8c7596c70'
            'f74ba3ab69029a420016eda9d98b193af422eba1bded482dbc999559af02d5ab'
            '2512fc048ee36d595512b3cdcef7ae1b0a3c6b3b4fb93e0208b650d99ed36aa5')
options=(!lto)

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2
export CMAKE_POLICY_VERSION_MINIMUM=3.5
export SHADERC_LIB_DIR=/usr/lib

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 < ../0001-update-pipewire-rs-to-fix-build-on-arch.patch
  patch -Np1 < ../0002-Updated-the-pipewire-reference-in-Cargo.lock.patch

  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd "../${pkgname}ctl"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cd "$pkgname"
  cargo build --frozen --release --all-features
  cd "../${pkgname}ctl"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}ctl"
  cd "$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/" "$pkgname.png"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "$pkgname.svg"
}

