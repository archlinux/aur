# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-lua'
pkgver='1.1.0'
pkgrel='3'
pkgdesc='PHP PECL extension for an embedded Lua interpreter'
arch=('i686' 'x86_64')
url='http://pecl.php.net/package/lua'
license=('PHP')
depends=('php>=5.1.0' 'lua')
source=(
    "http://pecl.php.net/get/lua-$pkgver.tgz"
    'liblua.so.patch'
)
sha256sums=(
    'f063fb8e8ba5cfe5e120d179b84db77ea3344ce08288b48864ccb883a9826554'
    'e193551d17c20fb6e053cfd2637a782e0f958c4c7500b6c77f5a427e7b10f400'
)
backup=('etc/php/conf.d/lua.ini')

prepare() {
    patch -p0 -i liblua.so.patch
}

build() {
    cd "$srcdir/lua-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-lua=/usr
    make
    echo 'extension=lua.so' > lua.ini
}

package() {
    pushd "$srcdir/lua-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 lua.ini "$pkgdir/etc/php/conf.d/lua.ini"
    popd
}
