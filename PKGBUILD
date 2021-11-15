# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=('groonga' 'groonga-doc')
pkgver=11.0.9
pkgbase=groonga
pkgrel=1
arch=('i686' 'x86_64')
url="http://groonga.org/"
license=('LGPL2.1')
source=("http://packages.groonga.org/source/groonga/$pkgbase-$pkgver.tar.gz"
        "http://packages.groonga.org/source/groonga/$pkgbase-$pkgver.tar.gz.asc"
        "groonga-httpd.service")
makedepends=('glib2' 'libedit' 'zeromq' 'autoconf-archive'
            'libevent' 'mecab' 'mecab-ipadic' 'msgpack-c' 'ruby' 'snowball-c-git')
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)

build() {
    # TODO: Enable to build arrow on AArch64/armv7h
    # TODO: grpc 1.28+ is currently causing issues to build arrow.
    # Currently, this line should be specifying to disable using arrow.
    cd $srcdir/$pkgbase-$pkgver
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

package_groonga-doc() {
    pkgdesc="Document for Groonga"
    arch=('any')

    cd $srcdir/$pkgbase-$pkgver/doc

    make DESTDIR="$pkgdir" install
}

package_groonga() {
    pkgdesc="An opensource fulltext search engine."
    depends=('glib2' 'libedit' 'zeromq' 'autoconf-archive'
             'libevent' 'mecab-ipadic' 'msgpack-c' 'ruby' 'snowball-c-git')
    optdepends=('cutter-test_framework' 'mercurial' 'kytea' 'arrow')

    cd $srcdir/$pkgbase-$pkgver
    make DESTDIR="$pkgdir" install

    # cleanup
    rm -r "${pkgdir}/var/run"

    # delete documents
    rm -r "${pkgdir}/usr/share/doc"

    install -Dm644 ../groonga-httpd.service "$pkgdir"/usr/lib/systemd/system/groonga-httpd.service
}
sha1sums=('db5905eaae0672dd000a5a0e14e0adab5b75a997'
          'SKIP'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
sha256sums=('c84fce93440d63df9ae2f7cd2566634785bc13f8be970ed3f395f6fa83b0f26e'
            'SKIP'
            '4d3f91b40b37ab473b716c6c303c1e58ca7b3f777439fc4c055be80d04ffa65b')
