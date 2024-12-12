# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# vim: set ts=4 sw=4 et:

pkgname=kellnr
pkgver=5.2.7
pkgrel=1
pkgdesc='The registry for Rust crates'
arch=('x86_64')
url='https://kellnr.io/'
license=(MIT)
depends=(
    openssl
    curl
    zlib
    bzip2
    glibc
    gcc-libs
)

makedepends=(
    just
    cargo
    npm
)
checkdepends=(
    cargo-nextest
)

install=kellnr.install

options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kellnr/kellnr/archive/refs/tags/v$pkgver.tar.gz"
        "pr-535.patch" # https://patch-diff.githubusercontent.com/raw/kellnr/kellnr/pull/535.patch
        "default.toml"
        "kellnr.service"
        "kellnr.sysusers"
        "kellnr.tmpfiles")
sha256sums=('b7c8dfd1c6d782f90c512991b6b456913d1cda30c6fb968dd3c19200c832eed6'
            'f31495eb6bd942ce6129bda32249777d22f47116e98a7b253ed853a7c311fb11'
            '0578c49efb3e81ece93cff2da758fd7248abb3f0c062d7ed2e98d8de5218cff6'
            '28c931c3b6c1ab2e16e318a55e137300a9bfdd8581d7d668a3350574094e1c6d'
            'a268b595b0048f3dda5d6cf8dea37d9c60b2333d8f4aae76ac93deb4b6e2e62e'
            'e81b1299bd28ca1691f7189c373f3672ec235a0ade8c23e195aeaf92a70ec1d6')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$pkgver"

    # PR written by me to make packaging less painful.
    # TODO: Remove on update if merged.
    patch -Np1 -i ../pr-535.patch
    
    cargo fetch --locked
    just npm-install
}

build() {
    cd "$pkgname-$pkgver"

    KELLNR_VERSION="$pkgver-arch" \
    KELLNR_CONFIG_DIR=/etc/kellnr \
    KELLNR_STATIC_DIR=/usr/share/kellnr \
        cargo build --frozen --release

    just npm-build
}

check() {
    cd "$pkgname-$pkgver"

    just test
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install the kellnr binary into `/usr/bin`.
    install -Dm0755 "target/$CARGO_BUILD_TARGET/release/$pkgname" -t "$pkgdir/usr/bin/"

    # Install the default config file into `/etc/kellnr`.
    install -Dm644 "$srcdir/default.toml" -t "$pkgdir/etc/kellnr"

    # Install the `static` directory into `/usr/share/kellnr`.
    pushd static
    find . -type f -exec install -Dm755 {} "$pkgdir/usr/share/kellnr/{}" \;
    popd

    # Install systemd service files.
    install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    
    # Install the license file (this is required for MIT).
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
