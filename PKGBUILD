# Maintainer: huntergunter89 <huntergunter89@gmail.com>
pkgname=squoosh-desktop
pkgver=0.1.1
pkgrel=1
pkgdesc='Local image compressor and converter, a native port of Squoosh written in Rust'
arch=('x86_64')
url='https://github.com/hunter-gunter/squoosh-desktop'
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'libwebp' 'libavif' 'lcms2' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libglvnd' 'wayland' 'hicolor-icon-theme')
makedepends=('cargo' 'nasm' 'pkgconf')
optdepends=('xdg-desktop-portal: native file dialogs'
            'xdg-desktop-portal-gtk: file chooser portal for GTK desktops'
            'xdg-desktop-portal-kde: file chooser portal for KDE Plasma')
# Cargo applies its own ThinLTO; makepkg's linker-plugin LTO drops bundled C objects.
# The release profile strips the binary, so a debug package would be empty.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1ed2448d85ee4658304b335cddae9f4c4685f108788f1134ed1b1592e165531')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p squoosh-desktop
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/squoosh-desktop -t "$pkgdir/usr/bin"
  install -Dm644 packaging/squoosh-desktop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 app/assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/squoosh-desktop.png"
  install -Dm644 README.md THIRD_PARTY.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE LICENSE-APACHE-2.0 -t "$pkgdir/usr/share/licenses/$pkgname"
}
