# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=openwebrtc
pkgver=0.3.0
pkgrel=1
pkgdesc="A mobile-first WebRTC client framework for building native apps"
arch=(i386 x86_64)
url="https://github.com/EricssonResearch/openwebrtc"
license=('BSD')
depends=(libnice libpulse gst-plugins-openwebrtc)
makedepends=(gtk-doc)
provides=(openwebrtc)
conflicts=(openwebrtc-git)
source=("https://github.com/EricssonResearch/$pkgname/archive/v$pkgver.tar.gz"
        "fix-compiler-errors.patch")
sha256sums=('b31b3e21ef49ddc4d6ee2776e1b556986bff8bfcce21e3ed73e03597fdce24be'
            'be5cd3fc66b4fcef9315c2a2e801a92aa6761af5a69d577096e807a16c6b2f81')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < "${srcdir}/fix-compiler-errors.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr --enable-bridge=no --enable-introspection=no --enable-debug=no --enable-tests=no
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
