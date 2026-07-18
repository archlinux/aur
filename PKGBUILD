# Maintainer: dividebysandwich <josef.jahn@gmail.com>
pkgname=torrentoxide
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hostable web-driven BitTorrent client (Leptos SSR + librqbit engine)"
arch=('x86_64')
url="https://github.com/dividebysandwich/torrentoxide"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'ca-certificates')
# cargo-leptos builds the wasm front-end and the native server in one step.
# dart-sass (SCSS) and binaryen/wasm-opt are used from PATH if present; the exact
# wasm-bindgen version is fetched by cargo-leptos itself. cmake+perl build the
# bundled AWS-LC (via aws-lc-sys, pulled in by librqbit's pure-Rust TLS stack).
makedepends=('rustup' 'cargo-leptos' 'dart-sass' 'binaryen' 'cmake' 'perl')
# Disable makepkg's LTO: aws-lc-sys is otherwise compiled to LTO-bitcode static
# archives that lld cannot resolve at the final Rust link, causing "undefined
# symbol" errors (aws_lc_*). Same fix as the rat-commander package.
options=('!lto')
backup=('etc/torrentoxide/torrentoxide.env')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.env"
        "$pkgname.install")
sha256sums=('206fdc332c4a758f086b7f98c8c8cb60103f1872ceb5576088c5245124b23086'
            '63bd08cc8d1d254565a9ea871f55295fb5a1894c2627c4660c5f3e6a6980605d'
            '7b65f301fbd9a1a048b02f2a18aa1a3a8a424fd78f68ec3824654f2bd6aaf677'
            '097bdca8c393a5c30d3f6d6bb807756729c397947edf3834d6dc5b9ca215a90a'
            '9883f6cc65355f4c58c58ab4682b9552aa268c18212c89d9b3fa263ef1ec51b8'
            '067302829e1ad14d9d919e9ac0e0cfe0d98370d986143c27addf1934e01dcba6')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # The hydrated front-end compiles to WebAssembly.
    rustup target add wasm32-unknown-unknown
    # Pre-fetch crate deps for both the native and wasm builds cargo-leptos runs.
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target wasm32-unknown-unknown
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Builds the release server binary (target/release/torrentoxide) and the
    # hydrated site assets (wasm/js/css under target/site).
    cargo leptos build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Native SSR server binary.
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Hydrated front-end (wasm/js/css/assets) served at runtime; the systemd
    # unit points LEPTOS_SITE_ROOT here.
    install -d "$pkgdir/usr/share/webapps/$pkgname"
    cp -r target/site "$pkgdir/usr/share/webapps/$pkgname/site"

    # systemd integration + system user and data dirs.
    install -Dm0644 "$srcdir/$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm0644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

    # User-editable runtime config (auth, session secret, bind address...).
    install -Dm0640 "$srcdir/$pkgname.env" "$pkgdir/etc/$pkgname/$pkgname.env"

    # Docs + license.
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
