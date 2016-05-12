# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=tv-renamer-git
pkgver=r22.10eba6b
pkgrel=1
pkgdesc="A TV series renaming application written in the Rust that supports adding titles to episodes using TVDB and with both a CLI and GTK3 interface"
arch=('i686' 'x86_64')
url="https://github.com/mmstick/tv-renamer/"
license=('GPL3')
depends=('gtk3')
makedepends=('cargo' 'git' 'gzip')
provides=("${pkgname%-git*}")
conflicts=("${pkgname%-git*}")
source=("$pkgname::git+https://github.com/mmstick/${pkgname%-git*}/#branch=master")
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
	 echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
     cd "$srcdir/$pkgname"
     cargo build --release --features "enable_gtk"
     sed -i '/\#/d' src/backend/man.rs
     mv src/backend/man.rs src/backend/${pkgname%-git*}.8
     gzip src/backend/${pkgname%-git*}.8
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 target/release/${pkgname%-git*} "$pkgdir/usr/bin/${pkgname%-git*}"
	install -D -m644 src/backend/${pkgname%-git*}.8.gz -t "${pkgdir}/usr/share/man/man8"
     	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
     	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
