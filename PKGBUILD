# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=tukai
pkgver=1.r0.g173a792
pkgrel=1
pkgdesc='interactive typing experience with switchable templates, designed to help users improve their typing speed and accuracy'
arch=('x86_64')
url="https://github.com/hlsxx/$pkgname"
license=('MIT')
source=("git+$url")
sha256sums=('SKIP')
makedepends=('rustup' 'glibc' 'gcc-libs' 'git')

pkgver() {
    cd "$pkgname"
    echo "1.r$(git describe --all --long | sed 's/-/./g' | cut -d '.' -f 2-)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
