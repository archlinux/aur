# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=mapstick
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial navigation map updater for Hyundai, Kia and Genesis: downloads the firmware onto a USB drive"
arch=('x86_64')
url="https://github.com/MikolajQ/mapstick"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libxkbcommon' 'udisks2' 'hicolor-icon-theme')
optdepends=('exfatprogs: format drives as exFAT'
            'libglvnd: hardware-accelerated rendering'
            'wayland: run on Wayland'
            'libx11: run on X11'
            'libxcursor: cursor themes on X11')
makedepends=('cargo' 'git')
options=('!lto')

source=("$pkgname-$pkgver.tar.gz::https://github.com/MikolajQ/mapstick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f77d9b28c27b8074ba222fbb20330e2c524a11441619811e7ed0ab75a800704f')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --package mapstick
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" packaging/mapstick.desktop
  install -Dm0644 packaging/icons/mapstick.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mapstick.svg"
  for size in 16 32 48 64 128 256 512; do
    install -Dm0644 "packaging/icons/mapstick-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps/mapstick.png"
  done
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md README.pl.md CHANGELOG.md
}
