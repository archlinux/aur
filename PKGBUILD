# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=paperling
pkgdesc="A minimal, distraction-free markdown editor"
pkgver=1.0.51
pkgrel=1
arch=(x86_64)
url="https://github.com/Razee4315/Paperling"
license=(Apache-2.0)
depends=(glibc libgcc gtk3 dbus libsoup3 cairo gdk-pixbuf2 webkit2gtk-4.1 hicolor-icon-theme)
makedepends=(bun cargo cargo-tauri nodejs)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "001-fix-version.patch::$url/commit/74d5ac73c63a5264a94e4cca98328ca2958b36a0.diff")
sha256sums=('ac15b88347c4fb53f3daba56f3455345d89e4bd250f4f6c3a0f1cfd56f136a99'
            'afd7f81537bc9e20a8548756d15c833d42824fd2a18fd5f0c1361fb67a46a1c6')

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

