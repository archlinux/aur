# Maintainer: Timo Sarawinski (timo@it-kraut.net)

pkgname='php80-rar'
pkgver='4.2.0'
pkgrel='4'
pkgdesc='PHP PECL extension for reading RAR archives using bundled unRAR library'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/rar'
license=('PHP')
depends=('php80')
source=("http://pecl.php.net/get/rar-$pkgver.tgz"
       "php81.patch::https://github.com/cataphract/php-rar/commit/ab26d285759e4c917879967b09976a44829ed570.patch")
sha256sums=('660d7d6bc97cc45395e56621aa8803a9f9d4b3436c576d67afe712c8f964a4b9'
            '2e76c0cb46927a952e7ef6fc6057b248311155a64a975925a97fe399a6ad6780')

prepare() {
    cd "$srcdir/rar-$pkgver"
    patch -Np1 -i "$srcdir/php81.patch"
}

build() {
    cd "$srcdir/rar-$pkgver"
    phpize80
    ./configure \
    --prefix=/usr \
    --with-php-config=php-config80 \
    --enable-rar
    make
    echo 'extension=rar.so' > rar.ini
}

check() {
    cd "$srcdir/rar-$pkgver"
    export TEST_PHPDBG_EXECUTABLE=phpdbg80
    export TEST_PHP_CGI_EXECUTABLE=php-cgi80
    export NO_INTERACTION="true"
    make -k test
}

package() {
    pushd "$srcdir/rar-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 rar.ini "$pkgdir/etc/php80/conf.d/rar.ini"
    popd
}
