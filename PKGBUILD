# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-git
pkgver=3.16.0.r291.g514ce7a
pkgrel=1
pkgdesc="Standalone language for system configuration, builds, and shell automation (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
options=(!lto)
depends=('gcc-libs' 'libgit2' 'libssh2' 'openssl' 'zlib' 'xz' 'zstd')
makedepends=('git' 'rust' 'cargo' 'pkg-config')
provides=('neve')
conflicts=('neve' 'neve-bin')
source=("git+https://github.com/MCB-SMART-BOY/Neve.git")
sha256sums=('SKIP')

pkgver() {
    cd Neve
    printf "3.16.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Neve
    export LIBGIT2_NO_VENDOR=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --release -p neve
}

check() {
    cd Neve
    cargo test --release -p neve-lexer -p neve-parser -p neve-eval -p neve-typeck -p neve-fmt -p neve-lsp --test lsp --test lsp_e2e
}

package() {
    cd Neve
    install -Dm755 "target/release/neve" "$pkgdir/usr/bin/neve"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
