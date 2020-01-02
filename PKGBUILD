_phpbase=72
pkgname=php72-xdebug
_extname=xdebug
pkgver=2.9.0
pkgrel=1
pkgdesc="Xdebug is an extension for PHP to assist with debugging and development"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php${_phpbase}")
makedepends=()
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php${_phpbase}/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize${_phpbase}
    ./configure
    make

    cd "$srcdir/$_extname-$pkgver/debugclient"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    install -m0755 -d "$pkgdir/etc/php${_phpbase}/conf.d/"
    install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    echo ";zend_extension=$_extname.so" > "$pkgdir/etc/php${_phpbase}/conf.d/$_extname.ini"
    chmod 0644 "$pkgdir/etc/php${_phpbase}/conf.d/$_extname.ini"
    install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config${_phpbase} --extension-dir)/$_extname.so"
    install -m0755 -D "$srcdir/$_extname-$pkgver/debugclient/debugclient" "$pkgdir/usr/bin/debugclient${_phpbase}"
}

md5sums=('8b8ca211cb7053c19aec2dbde4ab5ffa')
