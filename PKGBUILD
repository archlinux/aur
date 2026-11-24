# Maintainer: Davide Leva <davide.leva@outlook.com>
# SPDX-License-Identifier: 0BSD

pkgname=mdink
pkgver=1.0.0
pkgrel=1
pkgdesc='Compact, browser-free Markdown-to-PDF CLI with six themes and custom colors'
arch=('x86_64')
url='https://github.com/davide-leva/mdink'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'gcc')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'LICENSE')
sha256sums=('37ec6214c26017747749ed3ca4df179b98eed42b935ceb8c154704d1e3cdeb15'
            'a05a32fb37772cc1e5ab364cfec90ea5dad2efcaae51e1106b085451e7987149')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    MDINK_BIN="$PWD/target/release/mdink" cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/mdink "$pkgdir/usr/bin/mdink"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 native/fonts/LICENSE "$pkgdir/usr/share/licenses/$pkgname/fonts-LICENSE"
}
