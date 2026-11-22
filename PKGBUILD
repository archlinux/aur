# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

_name=shd
pkgname="${_name}-git"
pkgver=0.1.6.r5.g4baadc0
pkgrel=1
pkgdesc='Console tool to display drive list with commonly checked smart info - git version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/alttch/${_name}"
license=('MIT')
depends=('smartmontools>=7.0')
makedepends=('cargo' 'git')
provides=("${_name}")
conflicts=("${_name}")

source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"

    # Prepare correct target for our architecture
    local use_target="$CARCH-unknown-linux-musl"

    if [ "$CARCH" = 'armv7h' ]; then
        use_target='armv7-unknown-linux-musleabihf'
    fi

    cargo fetch --locked --target "$use_target"
}

build() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'

    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "target/release/${_name}" "$pkgdir/usr/bin/${_name}"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

