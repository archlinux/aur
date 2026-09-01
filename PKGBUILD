# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats
pkgver=0.2.8
pkgrel=1
pkgdesc='A tool for getting aggregated commit stats'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/git-stats'
license=('BlueOak-1.0.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
# The integration tests shell out to git to construct fixture repositories.
checkdepends=('git')
conflicts=('git-stats-bin')
# !debug: the release profile carries no debug info, so the auto-generated
#   -debug subpackage is noise for AUR distribution.
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukehsiao/git-stats/archive/v$pkgver.tar.gz")
sha256sums=('4f0eece6e6411013c5a4d6f4e2e375761db64a347d62e4bad20f21b89f23c98f')

prepare() {
    cd "$pkgname-$pkgver"
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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/git-stats "$pkgdir/usr/bin/git-stats"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
