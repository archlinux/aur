# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r374.878edb0
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake libc++ rust)
depends=(
avahi
gcc-libs
glibc
libevdev
libxkbcommon
mesa
opus
shaderc
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
)
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/${pkgname%-git}"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
cd "$srcdir/${pkgname%-git}"
cargo build --release
}

package() {
cd "$srcdir/${pkgname%-git}"
install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
install -Dm644 dist/moonshine.service "$pkgdir/usr/lib/systemd/user/moonshine.service"
install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
}
