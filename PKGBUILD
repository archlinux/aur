# Maintainer: Austin Riba <austin@m51.io>

pkgname=ripasso-gnome-search-provider
pkgver=1.1.1
pkgrel=1
pkgdesc='A GNOME search provider for the pass password manager written in rust with no runtime dependencies'
url='https://github.com/Fingel/ripasso-gnome-search-provider/'
license=('GPL-3.0-or-later')
depends=('libssh2')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d572d71c0a767909e401daecc6b525544a81fab7a72a0db65e6fb13f74b3fe41f7c0318e23034ec4f76629b9aea9eae7d8e47f58379cb58160e334116250fef8')

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
