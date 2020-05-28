# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=thrift-0.9
pkgver=0.9.3
pkgrel=1
pkgdesc='Scalable cross-language services framework for IPC/RPC'
arch=(i686 x86_64)
url='http://thrift.apache.org/'
license=(APACHE)
depends=(gcc-libs openssl)
makedepends=(qt5-base boost libevent)
optdepends=(
    'qt5-base: TQTcpServer support'
)
source=("https://github.com/apache/thrift/archive/$pkgver.tar.gz"
        sslv23.patch
        THRIFT-3576.patch)
sha512sums=('743131b276155c2d178404e190bdebcc12cedf42956f3d83177ebb4e4b85768b111a999dcf054594e92c120431323769a9641fc2ff2efade983191afd0786c2c'
            'bb84c9b14ad01c220c79305ec0661d9a5674a0f98ad0608afa5729b92bea82892c436d09c5e83270a00780b3264260d64b7b49f4ef02fbebc5fc09d4dd2a37c9'
            '6a091887f7d9dede834ca8b53af6df44b6dd6c73fc3a8615dc78f3fca405a6c9975d8dd138878603eb9d64350ad81fc08c8719dff3db045363852f57de866587')

prepare() {
    cd thrift-$pkgver
    patch -p2 -i "$srcdir/sslv23.patch"
    patch -p1 -i "$srcdir/THRIFT-3576.patch"
}

build() {
    cd thrift-$pkgver

    ./bootstrap.sh
    ./configure --prefix=/usr \
                --with-cpp \
                --with-c_glib \
                --with-qt5 \
                --with-libevent \
                --with-csharp \
                --without-java \
                --without-boost \
                --without-haskell \
                --without-php \
                --without-ruby \
                --without-python \
                --without-erlang \
                --without-perl \
                --without-c_sharp \
                --without-d \
                --without-php \
                --without-go \
                --without-lua \
                --without-nodejs

    make
}

check() {
    cd thrift-$pkgver
    make check
}

package() {
    cd thrift-$pkgver
    make DESTDIR="$pkgdir" install
    install -m0644 -D contrib/thrift.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/thrift.vim
}

# vim: set ts=4 sw=4 et :
