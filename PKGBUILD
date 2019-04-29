# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=groonga
pkgver=9.0.2
pkgrel=2
pkgdesc="An opensource fulltext search engine."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://groonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga/$pkgname-$pkgver.tar.gz"
        "groonga-httpd.service")
depends=('zlib' 'lz4' 'glib2' 'libedit' 'zeromq' 'arrow' 'autoconf-archive'
         'libevent' 'mecab' 'mecab-ipadic' 'msgpack-c')
optdepends=('cutter-test_framework' 'ruby' 'mercurial' 'kytea' 'snowball-c')

build() {
    # TODO: Enable arrow later
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --with-default-encoding=utf8 \
    --with-zlib \
    --with-lz4 \
    --without-stemmer \
    --enable-arrow \
    --enable-message-pack \
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
sha1sums=('6a0f099025df9c2439bc1fbbed698e285b2695fc'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
