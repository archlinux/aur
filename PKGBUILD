pkgname=stealth-mission-89
pkgver=0.8.0
pkgrel=1
pkgdesc='A Rust/Bevy remake of DOS-era 3D flight simulations with multiplayer, dynamic realtime campaign and VR support'
arch=('x86_64' 'aarch64')
url='https://github.com/dividebysandwich/stealth-mission-89'
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxi' 'libgcc'
         'libxkbcommon' 'libxrandr' 'systemd-libs' 'vulkan-icd-loader' 'wayland')
makedepends=('cargo')
optdepends=('openxr: VR headset support (--vr)')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6eb1beee36c2db3938a5c0c42812bbd8c8c43298d0bd8a5d463b49b82d91f607')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Release builds drop the default `dev` feature (bevy/dynamic_linking).
  cargo build --frozen --release -p stealth-mission-89 --no-default-features \
    --features stealth-mission-89/xr
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/lib/$pkgname/"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r --no-preserve=ownership assets "$pkgdir/usr/share/$pkgname/"

  # The game reads its assets from $BEVY_ASSET_ROOT; saves and settings go to the XDG dirs.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
export BEVY_ASSET_ROOT="\${BEVY_ASSET_ROOT:-/usr/share/$pkgname}"
exec /usr/lib/$pkgname/$pkgname "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  install -Dm644 packaging/linux/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/$pkgname.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 packaging/linux/$pkgname.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r --no-preserve=ownership docs/. "$pkgdir/usr/share/doc/$pkgname/"
}
