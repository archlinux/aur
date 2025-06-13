# Maintainer: Austin Riba <austin@m51.io>

pkgname=ripasso-gnome-search-provider
pkgver=1.2.1
pkgrel=1
pkgdesc='A GNOME search provider for the pass password manager written in rust with no runtime dependencies'
url='https://github.com/Fingel/ripasso-gnome-search-provider/'
license=('GPL-3.0-or-later')
depends=('libssh2')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e81c2e626d006d1b77ff59bc7dd4e3eb5e98f5bc6349cad3c63767b97e7cc7efb36e6a847800f21a6f16d9d1f935a05cb809d8d620a86b6a5811af051044c70f')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS=-lssh2
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 target/release/ripasso-gnome-search-provider "$pkgdir/usr/lib/ripasso-gnome-search-provider/ripasso-gnome-search-provider"
    install -Dm 0644 conf/io.m51.Pass.search-provider.ini "$pkgdir/usr/share/gnome-shell/search-providers/io.m51.Pass.search-provider.ini"
    install -Dm 0644 conf/io.m51.Pass.SearchProvider.desktop "$pkgdir/usr/share/applications/io.m51.Pass.SearchProvider.desktop"
    install -Dm 0644 conf/io.m51.Pass.SearchProvider.service.dbus "$pkgdir/usr/share/dbus-1/services/io.m51.Pass.SearchProvider.service"
    install -Dm 0644 conf/io.m51.Pass.SearchProvider.service.systemd "$pkgdir/usr/lib/systemd/user/io.m51.Pass.SearchProvider.service"
}
