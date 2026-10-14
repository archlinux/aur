# Maintainer: mfw <espadonne@outlook.com>

pkgname=cgfried
pkgver=0.1.0
pkgrel=1
pkgdesc='Standards-first C17 compiler for x86-64 and ARM64'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/Cgfried'
license=('GPL-3.0-only')
# Cgfried invokes the system linker and consumes the hosted C toolchain's
# startup objects and libraries. afs-as is built and installed with Cgfried.
depends=('binutils' 'gcc' 'glibc')
makedepends=('cargo' 'clang' 'dash' 'git' 'rust' 'unzip' 'zip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f3b6e70b3276171e8cee878e92b433d8f3d365452b69a33c8848f5e4f12a548')

build() {
    cd "$pkgname-$pkgver"
    make tools
    make EXTRA_CFLAGS="$LDFLAGS"
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install

    install -Dm644 doc/cgfried.1 "$pkgdir/usr/share/man/man1/cgfried.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
