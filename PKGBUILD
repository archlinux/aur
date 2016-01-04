# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-lua'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='PHP PECL extension for an embedded Lua interpreter'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/lua'
license=('PHP')
depends=('php>=7.0.0' 'lua')
source=(
    "http://pecl.php.net/get/lua-$pkgver.tgz"
    'liblua.so.patch'
)
sha256sums=(
    '774ef6c27c778f5f40b9c701eebd7d554ed2a0d4809bf6849aed83664f3df58f'
    'e193551d17c20fb6e053cfd2637a782e0f958c4c7500b6c77f5a427e7b10f400'
)

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
