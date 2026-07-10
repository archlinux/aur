# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=paperling
pkgdesc="A minimal, distraction-free markdown editor"
pkgver=1.0.48
pkgrel=1
arch=(x86_64)
url="https://github.com/Razee4315/Paperling"
license=(Apache-2.0)
depends=(glibc libgcc gtk3 dbus libsoup3 cairo gdk-pixbuf2 webkit2gtk-4.1 hicolor-icon-theme)
makedepends=(bun cargo cargo-tauri nodejs)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "001-fix-version.patch::$url/commit/af6d65df86d34a16fe2f1bdca9b33b83b05ef8e7.diff")
sha256sums=('8b07290c0dbd4f41cc74fc68c107303d6ce656f21746ba24222465712214277a'
            'bd58b930bed5f0cfdc6ad4f51a8c859f77f0f18504b0786196ac51e391198fc5')

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

