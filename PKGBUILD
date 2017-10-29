pkgname=groonga
pkgver=7.0.8
pkgrel=1
pkgdesc="An opensource fulltext search engine."
arch=('i686' 'x86_64' 'armv7h')
url="http://groonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga/$pkgname-$pkgver.tar.gz"
        "groonga-httpd.service")
depends=('zlib' 'lz4' 'glib2' 'libedit' 'zeromq' 'libevent' 'mecab' 'mecab-ipadic')
optdepends=('cutter-test_framework' 'ruby' 'mercurial' 'kytea' 'snowball-c')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --with-default-encoding=utf8 \
    --with-zlib \
    --with-lz4 \
    --without-stemmer \
    --enable-shared=yes \
    --enable-static=yes \
    --with-mecab \
    --with-mruby

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    # cleanup
    rm -r "${pkgdir}/var/run"

    install -Dm644 ../groonga-httpd.service "$pkgdir"/usr/lib/systemd/system/groonga-httpd.service
}
sha1sums=('6845fba142d4623bee2c3221c223d18f88f6f7ec'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
