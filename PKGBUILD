# Maintainer: Johnathan Corgan <johnathan@corganlabs.com>
pkgname=fips
pkgver=0.5.0
pkgrel=1
pkgdesc="Distributed, decentralized network routing protocol for mesh nodes"
url="https://github.com/jmcorgan/fips"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'clang')
optdepends=('systemd-resolved: .fips DNS resolution')
conflicts=('fips-git' 'fips-git-debug')
backup=('etc/fips/fips.yaml' 'etc/fips/hosts' 'etc/fips/fips.nft')
install=fips.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmcorgan/fips/archive/v$pkgver.tar.gz"
        "fips.sysusers"
        "fips.tmpfiles")
b2sums=('58330313639c75e6e3c3499d12963877ab055f72fdf5f9a64b87810264286aff9d07b3c85e53211f56a234dd51d33077684f726252428fa180989a4e22d4e1e1'
        '25a0552f3d67d12f48dfd40fe4776ad7c46afeeab76bd2674b48e234db3c145810a24569a8c1a7f4c186eb546f0fae2ebe1550080c0e91d8eb72ba9934c752a6'
        '844257cb8e09cd935d0d6345922d0f3ec777411daca20e24175b346a7b3cb95ebce12631a9466c4d94f1588ed8d62d92514ff24025ccfd0efb358e542b454b00')
options=('!lto' '!debug')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    export SOURCE_DATE_EPOCH=$(stat -c %Y Cargo.toml)
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo test --frozen --lib
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -Dm0755 target/release/fips "$pkgdir/usr/bin/fips"
    install -Dm0755 target/release/fipsctl "$pkgdir/usr/bin/fipsctl"
    install -Dm0755 target/release/fipstop "$pkgdir/usr/bin/fipstop"
    install -Dm0755 target/release/fips-gateway "$pkgdir/usr/bin/fips-gateway"

    # Systemd service files (from packaging/debian/ -- correct /usr/bin/ paths)
    install -Dm0644 packaging/debian/fips.service "$pkgdir/usr/lib/systemd/system/fips.service"
    install -Dm0644 packaging/debian/fips-dns.service "$pkgdir/usr/lib/systemd/system/fips-dns.service"
    install -Dm0644 packaging/debian/fips-gateway.service "$pkgdir/usr/lib/systemd/system/fips-gateway.service"
    install -Dm0644 packaging/debian/fips-firewall.service "$pkgdir/usr/lib/systemd/system/fips-firewall.service"

    # DNS helper scripts referenced by fips-dns.service
    install -Dm0755 packaging/common/fips-dns-setup "$pkgdir/usr/lib/fips/fips-dns-setup"
    install -Dm0755 packaging/common/fips-dns-teardown "$pkgdir/usr/lib/fips/fips-dns-teardown"

    # Config files (from packaging/common/)
    install -Dm0600 packaging/common/fips.yaml "$pkgdir/etc/fips/fips.yaml"
    install -Dm0644 packaging/common/hosts "$pkgdir/etc/fips/hosts"
    install -Dm0644 packaging/common/fips.nft "$pkgdir/etc/fips/fips.nft"

    # System integration (from local source files in $srcdir)
    install -Dm0644 "$srcdir/fips.sysusers" "$pkgdir/usr/lib/sysusers.d/fips.conf"
    install -Dm0644 "$srcdir/fips.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/fips.conf"

    # License
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
