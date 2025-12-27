# Maintainer: MCB-SMART-BOY <your-email@example.com>
pkgname=neve-git
pkgver=0.1.0.r4.ge26e6e0
pkgrel=1
pkgdesc="A pure functional language for system configuration and package management"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/neve"
license=('MPL-2.0')
depends=('gcc-libs' 'libgit2' 'libssh2' 'openssl' 'zlib' 'xz')
makedepends=('git' 'rust' 'cargo' 'pkg-config')
provides=('neve')
conflicts=('neve')
source=("git+https://github.com/MCB-SMART-BOY/neve.git")
sha256sums=('SKIP')

pkgver() {
    cd neve
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd neve
    export LIBGIT2_NO_VENDOR=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --release --locked
}

check() {
    cd neve
    export LIBGIT2_NO_VENDOR=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    # Skip fetch tests that require network
    cargo test --release --locked -- --skip fetch
}

package() {
    cd neve
    install -Dm755 "target/release/neve" "$pkgdir/usr/bin/neve"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
