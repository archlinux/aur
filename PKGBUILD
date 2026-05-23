# Maintainer: Main Serve Contributors <https://github.com/dekoding/main-serve>
pkgname=main-serve
pkgver=0.2.0
pkgrel=1
pkgdesc="A high-performance, YAML-configured web server"
arch=('x86_64' 'aarch64')
url="https://github.com/dekoding/main-serve"
license=('MIT')
depends=('gcc-libs' 'systemd')
makedepends=('rust' 'cargo' 'pkgconfig' 'sqlite')
backup=('etc/main-serve/config.yaml')
install=main-serve.install
conflicts=('main-serve-bin')
source=("$pkgname-$pkgver::https://github.com/dekoding/main-serve/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9bcdd62f57ace8cbab97bc60f08e7c64bdca6ae81acb88121bba719680a0933')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export CARGO_INCREMENTAL=0
    export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -g"
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs"
    export RUSTFLAGS="--remap-path-prefix=$PWD=/usr/src/debug/$pkgname"
    cargo clean
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/main-serve" "$pkgdir/usr/bin/main-serve"
    install -Dm644 "config/config.yaml" "$pkgdir/etc/main-serve/config.yaml"
    install -Dm644 "dist/main-serve.service" "$pkgdir/usr/lib/systemd/system/main-serve.service"
    install -Dm644 "dist/main-serve.sysusers" "$pkgdir/usr/lib/sysusers.d/main-serve.conf"
    install -Dm644 "dist/main-serve.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/main-serve.conf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
