# Maintainer: Leo <i@setuid0.dev>

_extname=ast
pkgname="php-$_extname"
pkgver='1.0.10'
pkgrel='2'
pkgdesc='Extension exposing PHP 7 abstract syntax tree'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('BSD-3')
depends=('php>=7.0')
source=(
    "http://pecl.php.net/get/$_extname-$pkgver.tgz"
    "00-test-output.patch"
)
sha256sums=(
    '606847ee736cfabc6a15620421b4e653ee8a466bf04d16710d0fa0f675c8458f'
    'SKIP'
)

prepare() {
    cd "$srcdir/$_extname-$pkgver"
    for i in "$srcdir/*.patch";
    do patch -p1 < $i;
    done
}

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-ast
    make
    echo -ne "n" | make test
    echo -ne "\n"
    echo "extension=$_extname" > $_extname.ini
}

package() {
    pushd "$srcdir/$_extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
    popd
}
