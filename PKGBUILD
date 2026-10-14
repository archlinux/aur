# Maintainer: Cristian Zmole <urma@rosint.org>
pkgname=urma-node
pkgver=0.7.1
pkgrel=1
pkgdesc='URMA archive node: service, control CLI and desktop status app'
arch=('x86_64')
url='https://github.com/urma-protocol/urma-node'
license=('0BSD')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'pnpm')
options=('!lto')
install=urma-node.install
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
# SKIP only here, for CI's local git-archive tarball; each release publishes urma-node-<ver>.PKGBUILD with its attached tarball's sha256.
sha256sums=('6a489b47977206cd38e56a044dd74be94b293e138788284e996084c66666548a')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cd urma-node-app
    pnpm install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --frozen --release -p urma-node --bins
    cd urma-node-app
    pnpm tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$srcdir/target/release/urma-node" "$pkgdir/usr/bin/urma-node"
    install -Dm755 "$srcdir/target/release/urma-node-control" "$pkgdir/usr/bin/urma-node-control"
    install -Dm755 "$srcdir/target/release/urma-node-app" "$pkgdir/usr/bin/urma-node-app"
    install -Dm644 urma-node-app/src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/urma-node.png"
    install -Dm644 urma-node-app/src/assets/urma-node.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/urma-node.svg"
    install -Dm644 contrib/aur/urma-node.desktop "$pkgdir/usr/share/applications/urma-node.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
