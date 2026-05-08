pkgname=cmdcreate
pkgver=1.3.1
pkgrel=1
pkgdesc="Allows you to create custom commands for your custom scripts"
arch=('x86_64' 'aarch64') 
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL3')

depends=('gcc-libs' 'curl' 'git' 'less' 'openssl')
makedepends=('cargo' 'cmake' 'clang')

conflicts=('cmdcreate-git')
provides=('cmdcreate')

options=('!lto')

source=("$pkgname-v$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-v$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"
    
    export LIBCLANG_PATH=/usr/lib
    export CFLAGS+=" -ffat-lto-objects"
    
    cargo build --release --frozen
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
