# Maintainer: Alexander Stepchenko <geochip@altlinux.org>
pkgname=vml
pkgver=0.1.9
pkgrel=1
pkgdesc="Tool for easy and transparent management of qemu virtual machines"
arch=('x86_64')
url="https://github.com/Obirvalger/vml"
license=('MIT')
depends=('cloud-utils' 'qemu-system-x86' 'openssh' 'socat')
makedepends=('cargo' 'openssl')
optdepends=('rsync: rsync to and from virtual machines')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('1633232b877002886705c39380dcc256dcfa1e154c4a39e881b09045e74d54c4')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    export RUSTFLAGS="$RUSTFLAGS -g"
    cargo build --release --offline --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -D -m755 "target/release/vml" "$pkgdir/usr/bin/vml"

    # Configs
    install -D -m644 "files/configs/config.toml" "$pkgdir/etc/$pkgname/config.toml"
    install -D -m644 "files/configs/images.toml" "$pkgdir/etc/$pkgname/images.toml"

    # Docs
    install -D -m644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -d -m755 "$pkgdir/usr/share/doc/$pkgname/doc/cloud-init/"
    cp -a doc/cloud-init/* "$pkgdir/usr/share/doc/$pkgname/doc/cloud-init/"

    install -d -m755 "$pkgdir/usr/share/doc/$pkgname/doc/commands/"
    cp -a doc/commands/* "$pkgdir/usr/share/doc/$pkgname/doc/commands/"

    install -d -m755 "$pkgdir/usr/share/doc/$pkgname/doc/network/"
    cp -a doc/network/* "$pkgdir/usr/share/doc/$pkgname/doc/network/"

    install -d -m755 "$pkgdir/usr/share/doc/$pkgname/doc/examples/buildbot/"
    cp -a doc/examples/buildbot/* "$pkgdir/usr/share/doc/$pkgname/doc/examples/buildbot/"

    # License
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
