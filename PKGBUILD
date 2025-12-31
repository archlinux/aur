# Maintainer: Jake Grant <jake@jakebgrant.com>
pkgname=phylax-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="A Polkit authentication agent written in GTK4"
arch=('x86_64')
url="https://github.com/jakeb-grant/phylax"
license=('Apache-2.0')
depends=('gtk4' 'polkit')
makedepends=('cargo' 'git')
provides=('phylax' 'polkit-authentication-agent')
conflicts=('phylax')
source=("git+https://github.com/jakeb-grant/phylax.git")
sha256sums=('SKIP')

pkgver() {
    cd phylax
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd phylax
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd phylax
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd phylax
    install -Dm755 "target/release/phylax" "$pkgdir/usr/bin/phylax"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
