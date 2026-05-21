# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Edmund Lodewijks <echo "==gCt92YuwWah1WYlR3byBHQ4VnbpxGajJXY" | rev | base64 -d>

pkgname=oniux
pkgver=0.11.0
pkgrel=1
pkgdesc='Isolate applications over Tor using Linux namespaces'
arch=(x86_64)
url='https://gitlab.torproject.org/tpo/core/oniux'
license=('MIT OR Apache-2.0')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=("git+$url.git#tag=v$pkgver?signed")
validpgpkeys=('772628464C6E8F56DBB5ACEC4CBE96203A1A78A7'  # Clara Engler <cve@cve.cx>
              '1C1BC007A9F607AA8152C040BEA7B180B1491921') # Alexander Færøy <ahf@0x90.dk>
b2sums=('fcb752c181826ddbdb3ada55a84b594a9e8822a0c95013a451a10528145da763192b8c29ba7859920e423912a2a448b1cee497417bc277ec21fcf169005343d0')

prepare() {
    cd oniux
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd oniux
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

package() {
    cd oniux
    install -Dm755 target/release/oniux -t "$pkgdir/usr/bin/"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname"
}
