# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=hurrycurry-server
pkgver=3.0.0
pkgrel=1
pkgdesc="A game about cooking (server)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/hurrycurry/hurrycurry"
license=('AGPL3')
makedepends=('rustup' 'deno' 'graphviz' 'godot' 'esbuild')
source=("hurrycurry-$pkgver.tar.gz::https://codeberg.org/hurrycurry/hurrycurry/archive/v$pkgver.tar.gz"
        "hurrycurry.service"
        "hurrycurry-registry.service"
        "hurrycurry.yaml"
        "tmpfiles.conf"
        "sysusers.conf")
sha256sums=('d0f5a0dcaad2bdc532e706f7e261cb2468882e4a72b11feb6535080d573ab1e3'
            '2e10c8882ef4847586f03ac5feb469294c1b2304928f8df41db12a1d84569eb7'
            'dec75b020f3a0bfc5c22f0fa013fe03d06feab608f9d4a42fb46d05dbed56844'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '47c6bd933fc96d08322d78a14c7932707b1dd1be2c1bb6eda2d212973f96aac9'
            'bbb29eff6b62d4530b04c0a964a88229212fea165f97a1c4674c53fae9fb4fe4')


rust_chost() {
	sed -e "s/-pc-linux/-unknown-linux/" -e "s/armv7l-/armv7-/" <<< "$CHOST"
}

prepare() {
    cd "hurrycurry"
    rustup default nightly
    cargo +nightly fetch --locked --target "$(rust_chost)"
}
build() {
    cd "hurrycurry"
    cargo build --frozen --release --target "$(rust_chost)" --bin hurrycurry-server
    cargo build --frozen --release --target "$(rust_chost)" --bin hurrycurry-replaytool
    cargo build --frozen --release --target "$(rust_chost)" --bin hurrycurry-registry
    cargo build --frozen --release --target "$(rust_chost)" --bin hurrycurry-discover
    make all_data
    make all_testclient
}
package() {
    install -Dm755 hurrycurry/target/"$(rust_chost)"/release/hurrycurry-server "$pkgdir/usr/bin/hurrycurry-server"
    install -Dm755 hurrycurry/target/"$(rust_chost)"/release/hurrycurry-replaytool "$pkgdir/usr/bin/hurrycurry-replaytool"
    install -Dm755 hurrycurry/target/"$(rust_chost)"/release/hurrycurry-registry "$pkgdir/usr/bin/hurrycurry-registry"
    install -Dm755 hurrycurry/target/"$(rust_chost)"/release/hurrycurry-discover "$pkgdir/usr/bin/hurrycurry-discover"
    install -Dm644 hurrycurry.service "$pkgdir/usr/lib/systemd/system/hurrycurry.service"
    install -Dm644 hurrycurry-registry.service "$pkgdir/usr/lib/systemd/system/hurrycurry-registry.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/hurrycurry.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/hurrycurry.conf"
    install -Dm644 hurrycurry/COPYING "$pkgdir/usr/share/licenses/hurrycurry-server/COPYING"
    install -Dm664 hurrycurry/test-client/main.js "$pkgdir/usr/share/hurrycurry/test-client/main.js"
    install -Dm664 hurrycurry/test-client/index.html "$pkgdir/usr/share/hurrycurry/test-client/index.html"
    install -dm755 "$pkgdir/usr/share/hurrycurry/test-client/locale"
    install -Dm664 -t "$pkgdir/usr/share/hurrycurry/test-client/locale" hurrycurry/test-client/locale/*
    install -Dm644 hurrycurry/data/index.yaml "$pkgdir/usr/share/hurrycurry/data/index.yaml"
    install -Dm644 -t "$pkgdir/usr/share/hurrycurry/data/recipes" hurrycurry/data/recipes/*.yaml 
    install -Dm644 -t "$pkgdir/usr/share/hurrycurry/data/maps" hurrycurry/data/maps/*.yaml
}
