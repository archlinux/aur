# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=groonga
pkgver=10.0.6
pkgrel=1
pkgdesc="An opensource fulltext search engine."
arch=('i686' 'x86_64')
url="http://groonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga/$pkgname-$pkgver.tar.gz"
        "groonga-httpd.service")
depends=('zlib' 'lz4' 'glib2' 'libedit' 'zeromq' 'autoconf-archive'
         'libevent' 'mecab' 'mecab-ipadic' 'msgpack-c' 'snowball-c-git')
optdepends=('cutter-test_framework' 'ruby' 'mercurial' 'kytea' 'arrow')

build() {
    # TODO: Enable to build arrow on AArch64/armv7h
    # TODO: grpc 1.28+ is currently causing issues to build arrow.
    # Currently, this line should be specifying to disable using arrow.
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --with-default-encoding=utf8 \
    --with-zlib \
    --with-lz4 \
    --disable-arrow \
    --enable-message-pack \
    --enable-shared=yes \
    --enable-static=yes \
    --with-mecab \
    --enable-mruby

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    # cleanup
    rm -r "${pkgdir}/var/run"

    install -Dm644 ../groonga-httpd.service "$pkgdir"/usr/lib/systemd/system/groonga-httpd.service
}
sha1sums=('8482747a37f3cf04de8e8e66d0bd137cf02ed3c1'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
sha256sums=('6932252fe5d13cf6651600c9e4f1b0ed14836cc7d9ee87e091f698c4a4e97de0'
            '4d3f91b40b37ab473b716c6c303c1e58ca7b3f777439fc4c055be80d04ffa65b')
