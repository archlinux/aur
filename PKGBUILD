# Maintainer: Charles Pritchard <charlespritchard.work@gmail.com>
pkgname=shiftpaper
pkgver=0.1.0
pkgrel=1
pkgdesc="Parallax wallpaper daemon for Wayland with monocular depth estimation"
arch=('x86_64')
options=('!lto')
url="https://github.com/CPritch/shiftpaper"
license=('MIT')
depends=('wayland' 'vulkan-icd-loader' 'onnxruntime')
makedepends=('rust')
optdepends=('cuda: GPU-accelerated depth inference')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CPritch/shiftpaper/archive/v$pkgver.tar.gz")
sha256sums=('6289ed97d0c538c17ac714517b8e6027baefbb3c2b3d749618e5d39c108e163a')

prepare() {
        cd "$pkgname-$pkgver"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
        cd "$pkgname-$pkgver"
        env | sort > /tmp/makepkg_env.txt
        export CARGO_TARGET_DIR=target
        cargo build --release --locked \
                --package shiftpaper-cli \
                --no-default-features \
                --features load-dynamic
        cargo build --release --locked --package shiftpaper-daemon
}

package() {
        cd "$pkgname-$pkgver"
        install -Dm755 target/release/shiftpaper  "$pkgdir/usr/bin/shiftpaper"
        install -Dm755 target/release/shiftpaperd "$pkgdir/usr/bin/shiftpaperd"
        install -Dm644 shiftpaperd.service \
                "$pkgdir/usr/lib/systemd/user/shiftpaperd.service"
        install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
