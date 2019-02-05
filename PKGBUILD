pkgname=php-solr-git
conflicts=('php-solr')
pkgver=r665.9c0e234
pkgrel=1
provides=("php-solr=${pkgver}")
pkgdesc='PHP PECL extension for Apache Solr API (git version)'
arch=('x86_64')
url='https://pecl.php.net/package/solr'
license=('PHP')
depends=('php')
source=("solr::git+https://github.com/php/pecl-search_engine-solr.git")
md5sums=('SKIP')
build() {
    cd "$srcdir/solr"
    phpize
    ./configure --prefix=/usr
    make
    echo 'extension=solr.so' > solr.ini
}

pkgver() {
    cd "$srcdir/solr"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    pushd "$srcdir/solr"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 solr.ini "$pkgdir/etc/php/conf.d/solr.ini"
    popd
}

