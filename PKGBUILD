# Maintainer: mschae23 <pkg@mschae23.de>

pkgname=dearrow-cli
pkgver=4.3.0
pkgrel=1
pkgdesc='Program to view and vote for DeArrow submissions'
url='https://mschae23.de/git/mschae23/dearrow-cli'
license=('AGPL-3.0-only')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'openssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/mschae23/$pkgname/archive/v$pkgver.tar.gz" '0001-correct-license.patch')
sha512sums=('a2d8cd3bf307d6c746a8f4a3626b6a36aa8302010eb77c922b1cb45d17fcf477891f88f268ce32d5b766963a192e3a85dbb09d53e06c83223ad183d6ce6a236f' '31633690825550f574469ebccebdd2167968b965a6f9192a6b2fe6c6318286f5716c734957631d78a468787a2426874dcd2ee0e3f82734970b6107c1b2a66bdb')

prepare() {
    cd "$pkgname-$pkgver"
    # dearrow-cli's code itself is licensed under GPL v3, but the package as a whole is under AGPL v3
    # Because AGPL-3.0.only is a common license and doesn't need to be installed, this patch is unnecessary
    # patch -Np1 --fuzz=0 -i ../0001-correct-license.patch

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "doc/${pkgname}.1" "$pkgdir/usr/share/man/man.1/${pkgname}.1"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
}
