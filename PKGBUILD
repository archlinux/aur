# Maintainer: shbernal <shbernal.01@gmail.com>
# Contributor: Sean Finkel <sean at protollix dot com>
# Issues and fixes: https://github.com/shbernal/aur-packages

pkgname=lumen-icue
_name=lumen
pkgver=0.2.0
pkgrel=1
pkgdesc="Lighting, fan and AIO LCD screen control for Corsair iCUE LINK hardware"
arch=('x86_64')
url="https://github.com/pxSean/lumen"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'xdg-terminal-exec')
makedepends=('cargo')
optdepends=(
  'nvidia-utils: GPU readings on NVIDIA cards with the proprietary driver'
)
options=('!lto')
install=lumen-icue.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/pxSean/lumen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('085a905f5122e8d0da68efb13d0e7a52a84f549bc6fa967ad43d123c9d7297df')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 target/release/lumen-icued target/release/lumenctl target/release/lumen-tui -t "$pkgdir/usr/bin/"
  install -Dm644 dist/lumen-icued.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 dist/70-lumen.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 dist/lumen.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
