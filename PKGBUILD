# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=tv-renamer-git
pkgver=0.2.5.r7.g66fa843
pkgrel=1
pkgdesc="A TV series renaming application written in the Rust that supports adding titles to episodes using TVDB and with both a CLI and GTK3 
interface"
arch=('i686' 'x86_64')
url="https://github.com/mmstick/tv-renamer/"
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'git' 'gzip')
provides=("${pkgname%-git*}-gtk")
conflicts=("${pkgname%-git*}")
source=("$pkgname::git+https://github.com/mmstick/${pkgname%-git*}/#branch=master")
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
     cd "$srcdir/$pkgname"
#     cargo build --release --features "enable_gtk"
     cp src/frontend/cli/man.rs src/frontend/cli/${pkgname%-git*}.8
     sed -i '/\#/d' src/frontend/cli/${pkgname%-git*}.8
     gzip -f src/frontend/cli/${pkgname%-git*}.8
     cp src/frontend/cli/${pkgname%-git*}.8.gz src/frontend/cli/${pkgname%-git*}-gtk.8.gz
     make
}

package() {
        cd "$srcdir/$pkgname"
        install -D -m755 target/release/${pkgname%-git*}-gtk "$pkgdir/usr/bin/${pkgname%-git*}-gtk"
        install -D -m644 assets/tv-renamer.desktop "$pkgdir/usr/share/applications/tv-renamer.desktop"
        install -D -m644 src/frontend/cli/${pkgname%-git*}.8.gz -t "${pkgdir}/usr/share/man/man8"
        install -D -m644 src/frontend/cli/${pkgname%-git*}-gtk.8.gz -t "${pkgdir}/usr/share/man/man8"
        install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

