# Maintainer: William Theesfeld <william@theesfeld.net>
pkgname=libgpg-stream
pkgver=1.1.7
pkgrel=1
pkgdesc="GNU-Standard GPG Streaming Library for secure multicast communication"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/theesfeld/libgpg-stream"
license=('GPL-3.0-or-later')
depends=('gpgme' 'glibc')
makedepends=('gcc' 'autoconf' 'automake' 'libtool' 'pkg-config')
optdepends=('gnupg: for GPG key management')
provides=("$pkgname=$pkgver")
backup=()
source=("https://github.com/theesfeld/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('557dc8b7d06da564dba04ffc745437c0f4625a9737fdba17dec0f004acce8371')

build() {
    cd "$pkgname-$pkgver"

    # Generate autotools build system
    ./autogen.sh

    # Configure with standard GNU paths
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --includedir=/usr/include \
        --enable-examples \
        --disable-debug

    # Build library and examples
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver"

    # Install library and headers
    make DESTDIR="$pkgdir" install

    # Install examples to documentation directory
    install -Dm755 examples/example-sender "$pkgdir/usr/share/doc/$pkgname/examples/example-sender"
    install -Dm755 examples/example-receiver "$pkgdir/usr/share/doc/$pkgname/examples/example-receiver"

    # Install license
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
