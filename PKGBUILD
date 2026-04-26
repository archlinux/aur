# Maintainer: zyxisme <d0116u@gmail.com>
pkgname=sshkeyman
pkgver=0.1.0
pkgrel=1
pkgdesc="Web-based SSH key & config manager"
arch=('x86_64')
url="https://github.com/zyxisme/sshkeyman"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/sshkeyman "$pkgdir/usr/bin/sshkeyman"

    # Static files needed at runtime
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r static "$pkgdir/usr/share/$pkgname/"

    # Wrapper: run from /usr/share/sshkeyman so static/ is found
    mv "$pkgdir/usr/bin/sshkeyman" "$pkgdir/usr/share/$pkgname/sshkeyman-bin"
    cat > "$pkgdir/usr/bin/sshkeyman" << 'EOF'
#!/bin/sh
exec /usr/share/sshkeyman/sshkeyman-bin "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/sshkeyman"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
