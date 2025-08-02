# Maintainer: mia <mia@mia.jetzt>

pkgname='quickmix'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='mix together a webpage without the hassle'
url='https://git.sr.ht/~conger/quickmix'
license=('MIT')
makedepends=('cargo')
testdepends=('python')
arch=('x86_64')
source=("https://git.sr.ht/~conger/quickmix/archive/v$pkgver.tar.gz")
sha256sums=('0d490a94a19a15f9aa58d7ba9bed345c47d9155b071daef18b17386dedd1dc30')

prepare() {
    cd quickmix-v$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd quickmix-v$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd quickmix-v$pkgver
    python tests/run.py target/release/quickmix
}

package() {
    cd quickmix-v$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
