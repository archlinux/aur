# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Edmund Lodewijks <echo "==gCt92YuwWah1WYlR3byBHQ4VnbpxGajJXY" | rev | base64 -d>

pkgname=oniux
pkgver=0.8.1
pkgrel=1
pkgdesc='Isolate applications over Tor using Linux namespaces'
arch=(x86_64)
url='https://gitlab.torproject.org/tpo/core/oniux'
license=('MIT OR Apache-2.0')
depends=(gcc-libs glibc)
makedepends=(cargo git)
options=(!lto)
source=("git+$url.git#tag=v$pkgver?signed")
validpgpkeys=('772628464C6E8F56DBB5ACEC4CBE96203A1A78A7')
b2sums=('99116de8715d0ff0d84a2ccd3a0f13e63140378264d13844241e19f976c9dcc9fa97189bead63285329fe1c3f8e6d359d34b386e9aeae8ac250e84bcb17d00ee')

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
