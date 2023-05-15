# Maintainer: poly000 <pedajilao@163.com>
pkgname=c2rust
_pkgname=c2rust
pkgver=0.17.0
pkgrel=1
pkgdesc="Migrate C code to Rust"
url="https://github.com/immunant/c2rust"

conflicts=('c2rust-bin' 'c2rust-git')

arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

license=('Apache-2.0' 'MIT')
depends=('llvm')
makedepends=('cargo' 'llvm' 'clang' 'cmake' 'openssl' 'python')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/immunant/c2rust/archive/v${pkgver}.tar.gz")

sha256sums=('7a178ad0f858e6169aa5c0edc85e04c754b954de4d0c3336d90a98ec8f583512')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -vDm644 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    find "target/release" -type f -name "*-*.d" -print -delete 
    cp -av "target/release/${_pkgname}-"* "${pkgdir}/usr/bin/"
} 
