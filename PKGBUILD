# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=face-unlock
pkgver=3.0.0
pkgrel=1
pkgdesc="Face ID for Linux: the lock screen, sudo and admin prompts by face, on Plasma, GNOME, Hyprland and Niri"
arch=('x86_64' 'aarch64')
url="https://github.com/LoonixTools/face-unlock"
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0')
# Rust since 3.0.0. The window is drawn with Rune, which opens its libraries
# by name: fontconfig, the Vulkan loader, wayland and libxkbcommon.
# vulkan-driver: the loader alone draws nothing.
depends=('gcc-libs' 'glibc' 'pam' 'polkit' 'systemd'
         'fontconfig' 'hicolor-icon-theme' 'libxkbcommon' 'vulkan-driver' 'vulkan-icd-loader'
         'wayland')
makedepends=('cargo' 'scdoc')
optdepends=('hyprpolkitagent: password windows on Hyprland and Niri')
# The old name.
replaces=('plasma-face-unlock')
conflicts=('plasma-face-unlock')
# !debug: upstream's release profile strips the binaries itself, so there is
# nothing left to split into a debug package.
options=('!debug')
install="${pkgname}.install"
# The two face networks come from the OpenCV model zoo, pinned by checksum.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "face_detection_yunet_2023mar.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_detection_yunet/face_detection_yunet_2023mar.onnx"
        "face_recognition_sface_2021dec.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_recognition_sface/face_recognition_sface_2021dec.onnx")
noextract=('face_detection_yunet_2023mar.onnx' 'face_recognition_sface_2021dec.onnx')
sha256sums=('c24ffb8dda1951e68d623996ff09ab6fd4b342c5d20dd23cfa8b94e9a8a1caa6' '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4' '0ba9fbfa01b5270c96627c4ef784da859931e02f04419c829e83484087c34e79')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # upstream's Makefile: every program, the PAM module and the man page. The
  # version comes from Cargo.toml.
  make CARGOFLAGS="--release --frozen"
}

check() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen --workspace
}

package() {
  make -C "${pkgname}-${pkgver}" MODELS_SRC="$srcdir" DESTDIR="$pkgdir" install
}
