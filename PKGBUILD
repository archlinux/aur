# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=('groonga')
pkgver=15.0.9
pkgbase=groonga
pkgrel=2
arch=('i686' 'x86_64')
url="http://groonga.org/"
license=('LGPL2.1')
source=("https://github.com/groonga/groonga/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz"
    "https://github.com/groonga/groonga/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz.asc"
    "groonga-httpd.service")
makedepends=('glib2' 'libedit' 'zeromq' 'autoconf-archive' 'libstemmer'
    'libevent' 'mecab' 'mecab-ipadic' 'msgpack-c' 'ruby' 'cmake')
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)

build() {
    cd $srcdir/$pkgbase-$pkgver
    cmake . -DCMAKE_INSTALL_PREFIX="/usr" \
        -DGRN_WITH_MRUBY=ON \
        -DGRN_WITH_APACHE_ARROW=ON

    cmake --build .
}

package_groonga() {
    pkgdesc="An opensource fulltext search engine."
    depends=('glib2' 'libedit' 'zeromq' 'autoconf-archive' 'arrow' 'simdjson'
        'libevent' 'mecab-ipadic' 'msgpack-c' 'ruby' 'libstemmer')
    optdepends=('cutter-test_framework' 'mercurial' 'kytea')

    cd $srcdir/$pkgbase-$pkgver
    cmake --install . --prefix="$pkgdir/usr"

    # cleanup
    rm -rf "${pkgdir}/var/run"

    install -Dm644 ../groonga-httpd.service "$pkgdir"/usr/lib/systemd/system/groonga-httpd.service
}
sha1sums=('1c01eeb3af69b42e4faa2fb89b5c56cda1261a6f'
    'SKIP'
    '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
sha256sums=('f9969d2f8025a31dd201d8ce0e5db3a1547144e6191f75a9bbb1d771b7f0def2'
    'SKIP'
    '4d3f91b40b37ab473b716c6c303c1e58ca7b3f777439fc4c055be80d04ffa65b')
