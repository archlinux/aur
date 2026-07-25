# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=polonium
pkgname=kwin-polonium
pkgver=1.2.1
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up'
arch=(x86_64 i686 aarch64 armv7h)
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('cargo' 'git' 'npm' 'typescript')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/zeroxoneafour/polonium/archive/refs/tags/v$pkgver.tar.gz"
        'kwin-api::git+https://github.com/zeroxoneafour/kwin-api.git#commit=8fc04bd086a1445ea67783eaa33517b70e01c063')
sha1sums=('78c604ce2a0919e6ff4b5acc6e6fca54b649a608'
          'b85280ef82a0b6291cffa03468c7efa2bf633f0d')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -d kwin-api
    ln -s "$srcdir/kwin-api" kwin-api

    cd dbus-saver
    export RUSTUP_TOOLCHAIN=stable
    sed -i 's/1\.2\.0/1\.2\.1/' Cargo.lock
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$_pkgname-$pkgver"
    [[ -d pkg ]] && make clean
    make src res

    cd dbus-saver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname-$pkgver"
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"
    install -D -o root -m 644 -t "$pkgdir/usr/share/applications" res/polonium-settings.desktop

    install -D -o root -m 755 -t "$pkgdir/usr/bin" dbus-saver/target/release/polonium-saver
    install -D -o root -m 644 -t "$pkgdir/usr/lib/systemd/user" dbus-saver/polonium-saver.service
    install -D -o root -m 644 -t "$pkgdir/usr/share/dbus-1/services" dbus-saver/xyz.vaughanm.polonium.service

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
