# Maintainer: CodeCraft <behll8948 at gmail dot com>
pkgname=xwin-git
pkgrel=1
pkgname-dir=xwin
pkgver=0.6.7.r1.g590837e
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
depends=('glibc')
conflicts=('xwin' 'xwin-cargo')
makedepends=('cargo' 'clang' 'lld')
source=("xwin::git+https://github.com/Jake-Shadle/xwin.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname-dir"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$pkgname-dir"
    # Clang+LLD needed in place of GCC+BFD if LTO is enabled or else final link fails
    export CC=clang
    export CFLAGS+=" -fuse-ld=lld"
    export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"
    cargo build --release
}

package() {
    cd "$pkgname-dir"
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname-dir"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname-dir" ./*.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname-dir" ./LICENSE-*
}
