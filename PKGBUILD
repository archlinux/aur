# Maintainer: Aleksei Gusev <aleksei.gusev@gmail.com>

pkgname=krunner-zed
pkgver=0.1.4
pkgrel=1
pkgdesc="KRunner plugin to access Zed recent projects"
arch=('x86_64')
url="https://github.com/hron/krunner-zed"
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'krunner'
    'kservice'
)
makedepends=('rust' 'cargo')
optdepends=('kde-cli-tools: kstart for proper starting Zed in KDE environment')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hron/krunner-zed/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e856c99349152fa1b20231ee87c9b99b3db3286cf207f24bf9061f0c7f06949')

prepare() {
    cd "$pkgname-$pkgver" || exit 1
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Strip LTO flags: LTO-compiled C objects (bundled sqlite3) are not
    # compatible with Rust's linker when CFLAGS contains -flto=auto.
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CFLAGS="${CFLAGS/-flto/}"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver" || exit 1

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "package/krunner_zed.desktop" \
        "$pkgdir/usr/share/krunner/dbusplugins/krunner_zed.desktop"

    sed "s|Exec=|Exec=/usr/bin/$pkgname|" \
        "package/dev.algus.krunner_zed.service" \
        >"$srcdir/dev.algus.krunner_zed.service"
    install -Dm644 "$srcdir/dev.algus.krunner_zed.service" \
        "$pkgdir/usr/share/dbus-1/services/dev.algus.krunner_zed.service"
}
