# Maintainer: giosuel <me@giosuel.ch>
pkgname=lituus
pkgver=0.2.0
pkgrel=1
pkgdesc='Settings for Hyprland: network, Bluetooth, sound and displays'
arch=('x86_64' 'aarch64')
url='https://github.com/giosuel/lituus'
license=('AGPL-3.0-or-later' 'OFL-1.1')
# The libraries for X11, Wayland and OpenGL are loaded at runtime (winit, glutin).
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'networkmanager' 'wayland')
optdepends=('networkmanager-openvpn: OpenVPN connections'
            'networkmanager-openconnect: Cisco AnyConnect connections, with web sign-in'
            'bluez: Bluetooth, and files over Bluetooth (its obexd)'
            'pipewire-pulse: the Sound page and Bluetooth audio profiles'
            'hyprland: the Displays page'
            'xdg-desktop-portal: file dialogs (certificates, VPN files, files to send)'
            'gnome-keyring: passwords kept "for me only" (or KWallet)')
makedepends=('cargo')
# The window tests lay out text: without a font, fontconfig matches nothing and they fail (a
# clean chroot has none).
checkdepends=('ttf-dejavu')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d966dd34e191d48568ff142d7c1455d74b3764c7a21b3a9998a54010c319fb6d')

prepare() {
  cd "$pkgname-$pkgver"
  # The sources say 0.0.0-dev: write the version in, as the release workflow does.
  scripts/set-version.sh "$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p lituus
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/lituus -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/ch.giosuel.Lituus.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/ch.giosuel.Lituus.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 packaging/linux/icons/ch.giosuel.Lituus.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  # The fonts built into the binary.
  install -Dm644 crates/app/ui/fonts/*-LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
