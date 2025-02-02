# Maintainer: Austin Riba <austin@m51.io>

pkgname=ripasso-gnome-search-provider
pkgver=1.2.0
pkgrel=2
pkgdesc='A GNOME search provider for the pass password manager written in rust with no runtime dependencies'
url='https://github.com/Fingel/ripasso-gnome-search-provider/'
license=('GPL-3.0-or-later')
depends=('libssh2')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8bd024fe3bb5c92dd3ea3b62abe0034fdd9b5ac08b66fb6708ad1f93ba44a4694f6a21ff98ef76d406e96897b175ec5642a2ba4fe2850061588ea650264d7969')

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
