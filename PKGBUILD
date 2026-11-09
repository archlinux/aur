# Maintainer: Guillaume VanderEst <gvanderest@gmail.com>
pkgname=datadog-pup-cli
pkgver=2.4.2
pkgrel=1
pkgdesc="Datadog API CLI (pup) — OAuth2/API-key CLI for metrics, logs, monitors, traces across 30+ Datadog products (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/DataDog/pup"
license=('Apache-2.0')
makedepends=('cargo' 'cmake' 'clang' 'nasm')
provides=('datadog-pup-cli')
# Installs /usr/bin/pup — collides with the unrelated HTML-parser `pup` (ericchiang) in the AUR.
conflicts=('datadog-pup-cli-bin' 'pup' 'pup-bin' 'pup-git')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pup_${pkgver}_source.tar.gz")
sha256sums=('bd768ca40160fca677bb7f87e39756ae7bc16100013acae3bf0c4e1d8bd767c6')

prepare() {
    cd "$srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$srcdir"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    install -Dm755 "$srcdir/target/release/pup" "$pkgdir/usr/bin/pup"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    [ -f "$srcdir/LICENSE-3rdparty.csv" ] && install -Dm644 "$srcdir/LICENSE-3rdparty.csv" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rdparty.csv"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    local B="$srcdir/target/release/pup"
    "$B" completions bash >"$srcdir/pup.bash" 2>/dev/null \
        && install -Dm644 "$srcdir/pup.bash" "$pkgdir/usr/share/bash-completion/completions/pup"
    "$B" completions zsh >"$srcdir/_pup" 2>/dev/null \
        && install -Dm644 "$srcdir/_pup" "$pkgdir/usr/share/zsh/site-functions/_pup"
    "$B" completions fish >"$srcdir/pup.fish" 2>/dev/null \
        && install -Dm644 "$srcdir/pup.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pup.fish"
}
