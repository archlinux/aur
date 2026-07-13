# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=paperling
pkgdesc="A minimal, distraction-free markdown editor"
pkgver=1.0.49
pkgrel=1
arch=(x86_64)
url="https://github.com/Razee4315/Paperling"
license=(Apache-2.0)
depends=(glibc libgcc gtk3 dbus libsoup3 cairo gdk-pixbuf2 webkit2gtk-4.1 hicolor-icon-theme)
makedepends=(bun cargo cargo-tauri nodejs)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "001-fix-version.patch::$url/commit/cef567a3fa1bf24cb884bc058889bfbc1556a1ef.diff")
sha256sums=('6651be9f5834aac5f331835ca468f9500ed27f4a1cc88a5ce85b0e99c67706d0'
            'd4080f537ebefaa8548ae341e0386753a003937615d9b6510bf09fbc8006911d')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname^}-$pkgver"
    patch -p1 < "$srcdir/001-fix-version.patch"
    bun install --frozen-lockfile --ignore-scripts
    cd src-tauri
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname^}-$pkgver"
    bun run cargo tauri build -b deb --no-sign --ci -- --frozen
}

package() {
    local x86_64=amd64
    local aarch64=aarch64

    cd "${pkgname^}-$pkgver/src-tauri/target/release/bundle/deb/${pkgname^}_${pkgver}_${!CARCH}/data"
    cp -a usr "$pkgdir"
    install -Dm644 "$srcdir/${pkgname^}-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$srcdir/${pkgname^}-$pkgver/"{LICENSE,NOTICE} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

