# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=hurrycurry-server
pkgver=1.5.1
pkgrel=1
pkgdesc="A game about cooking (server)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/hurrycurry/hurrycurry"
license=('AGPL3')
makedepends=('rustup' 'deno' 'graphviz' 'godot')
source=("hurrycurry-$pkgver.tar.gz::https://codeberg.org/hurrycurry/hurrycurry/archive/v$pkgver.tar.gz"
        "hurrycurry.service"
        "hurrycurry.yaml"
        "sysusers.conf")
sha256sums=('bd4e84c221fe7436ac731acdacc419e4b6ad637bfbcbacc65ee7f71e01b91d26'
            'd520ab278a04fd434429833e806b67f876529fcbbf7e8f5aa80c3e102b621750'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'bbb29eff6b62d4530b04c0a964a88229212fea165f97a1c4674c53fae9fb4fe4')

prepare() {
    curl 'https://s.metamuffin.org/static/hurrycurry/book.pdf' -o book.pdf
    cd "hurrycurry"
    rustup default nightly
    cargo +nightly fetch --locked --target "$CHOST"
}
build() {
    cd "hurrycurry"
    cargo +nightly build --frozen --release --target "$CHOST" --bin hurrycurry-server
    cargo +nightly build --frozen --release --target "$CHOST" --bin hurrycurry-replaytool
    make -C data all
    make -C data recipes/default.svg
    esbuild test-client/main.ts --bundle --outdir=test-client
}
package() {
    install -Dm755 hurrycurry/target/$CHOST/release/hurrycurry-server "$pkgdir/usr/bin/hurrycurry-server"
    install -Dm755 hurrycurry/target/$CHOST/release/hurrycurry-replaytool "$pkgdir/usr/bin/hurrycurry-replaytool"
    install -Dm644 hurrycurry.service "$pkgdir/usr/lib/systemd/system/hurrycurry.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/hurrycurry.conf"
    install -Dm644 hurrycurry/COPYING "$pkgdir/usr/share/licenses/hurrycurry-server/COPYING"
    install -Dm664 -t "$pkgdir/usr/share/hurrycurry/test-client" hurrycurry/test-client/* 
    install -Dm644 hurrycurry/data/index.yaml "$pkgdir/usr/share/hurrycurry/data/index.yaml"
    install -Dm664 -t "$pkgdir/usr/share/hurrycurry/data/recipes" hurrycurry/data/recipes/*.yaml 
    install -Dm664 -t "$pkgdir/usr/share/hurrycurry/data/maps" hurrycurry/data/maps/*.yaml 
    install -Dm664 -t "$pkgdir/usr/share/doc/hurrycurry/recipes" hurrycurry/data/recipes/*.svg 
    install -Dm664 book.pdf "$pkgdir/usr/share/doc/hurrycurry/book.pdf"
}
