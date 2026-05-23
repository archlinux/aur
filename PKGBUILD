# Maintainer: Karso Cheung <karsoo2023@gmail.com>
pkgname=asus-sound-fix
pkgver=0.1.2
pkgrel=2
pkgdesc="Fix no sound issue on ASUS Vivobook S14 Flip TP3407SA"
arch=('x86_64')
url="https://github.com/Karso2023/vivobook_sound_fix"
license=('GPL3')
depends=()
makedepends=('cargo' 'rust')
install=asus-sound-fix.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Karso2023/vivobook_sound_fix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51b3fd83bfc33b413673a3044f272a102afa7c38b4f99b8acd544cdf31802b75')

_srcdir="vivobook_sound_fix-$pkgver"

prepare() {
    cd "$srcdir/$_srcdir/sound-fix"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_srcdir/sound-fix"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_srcdir"
    install -Dm755 "sound-fix/target/release/sound-fix" "$pkgdir/usr/bin/asus-sound-fix"
    install -Dm644 "systemd/vivobook-sound-fix.service" "$pkgdir/usr/lib/systemd/system/asus-sound-fix.service"
}
