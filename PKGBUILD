# Maintainer: William Theesfeld <william@theesfeld.net>
pkgname=libgpg-stream
pkgver=1.1.9
pkgrel=2
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
sha256sums=('3a8a4041b4b40d4e19696331d1b3123951e6238a8c63ec84087b32109770ea93')

build() {
    cd "$pkgname-$pkgver"

    # Set proper build flags
    export CFLAGS="${CFLAGS} -O2"
    export CPPFLAGS="${CPPFLAGS} -O2"

    # Generate autotools build system
    ./autogen.sh

    # Configure with standard GNU paths and proper optimization
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --includedir=/usr/include \
        --enable-examples \
        --disable-debug \
        --disable-dependency-tracking

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

    # Run libtool --finish to complete installation
    libtool --finish "$pkgdir/usr/lib"

    # Remove libtool archives (.la files) to prevent $srcdir references
    find "$pkgdir" -name '*.la' -delete

    # Install examples to documentation directory
    install -Dm755 examples/example-sender "$pkgdir/usr/share/doc/$pkgname/examples/example-sender"
    install -Dm755 examples/example-receiver "$pkgdir/usr/share/doc/$pkgname/examples/example-receiver"

    # Install license
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
