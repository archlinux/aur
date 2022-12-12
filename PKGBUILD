# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww-git
pkgver=0.6.0.13.g86b674e
pkgrel=2
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo')
provides=('swww')
conflicts=('swww')
source=("swww::git+https://github.com/Horus645/swww.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/swww"
    git describe --tags --match 'v*' | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/swww"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/swww"
    cargo build --release 
}

package() {
    cd "$srcdir/swww"

    install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
    install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
    install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
    install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
    install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

