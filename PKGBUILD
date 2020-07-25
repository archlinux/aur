# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=groonga
pkgver=10.0.4
pkgrel=2
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
sha1sums=('b6e4026303397ad1ab6fe068e8b449b467ad3293'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
