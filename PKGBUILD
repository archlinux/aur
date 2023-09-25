# Maintainer: Hauke Ingwersen <hauing@pm.me>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgver=2.1.8
pkgname=espanso-wayland
pkgver=2.1.8
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=('dbus' 'libnotify' 'libxkbcommon' 'wl-clipboard' 'wxwidgets-gtk3')
makedepends=("cargo" "cargo-make" "git" "rust-script")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=("!lto")  # fails with LTO as of 2022-03
install=espanso-wayland.install
source=("git+https://github.com/federico-terzi/espanso.git#tag=v${_pkgver}")
sha512sums=('SKIP')


prepare() {
  cd "${pkgname%-*}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # don't change the original service file, as it will be embedded in the binary
  cp "${pkgname%-*}/src/res/linux/systemd.service" "systemd.service"
  sed -i "s|{{{${pkgname%-*}_path}}}|/usr/bin/${pkgname%-*}|g" "systemd.service"

  # Icon name
  sed -i "s/Icon=icon/Icon=${pkgname%-*}/g" "${pkgname%-*}/src/res/linux/${pkgname%-*}.desktop"
}

build() {
  cd "${pkgname%-*}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo make --profile release --env NO_X11=true build-binary
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "target/release/${pkgname%-*}" -t "${pkgdir}/usr/bin/"
  install -Dm644 systemd.service "${pkgdir}/usr/lib/systemd/user/${pkgname%-*}.service"
  install -Dm644 "${pkgname%-*}/src/res/linux/${pkgname%-*}.desktop" -t \
    "${pkgdir}/usr/share/applications/"
  install -Dm644 "${pkgname%-*}/src/res/linux/icon.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-*}/"
}
