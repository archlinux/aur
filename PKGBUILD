ext_name=xdebug
phpbase=74
suffix=
pkgname="php${phpbase}-${ext_name}${suffix}-working"
pkgver=3.1.5
source=("http://pecl.php.net/get/$ext_name-$pkgver.tgz")
pkgrel=1
pkgdesc="php${phpbase}${suffix} Xdebug extension"
arch=("x86_64" "i686")
url="https://xdebug.org/"
license=('Xdebug')
makedepends=("php${phpbase}${suffix}")


# Fix applied: The Xdebug 3.1.5 source has a bug where xdebug_develop_minit() is declared without parameters 
# in src/develop/develop.h:70 but called with INIT_FUNC_ARGS_PASSTHRU in xdebug.c:547. 
# added a prepare() function to the PKGBUILD that runs a sed command to fix the declaration before compilation
prepare() {
    cd "${ext_name}-${pkgver}"
    sed -i 's/^void xdebug_develop_minit();/void xdebug_develop_minit(INIT_FUNC_ARGS);/' src/develop/develop.h
}

build() {
    cd "${ext_name}-${pkgver}"
    phpize${phpbase}${suffix}
    ./configure \
        --with-php-config=php-config${phpbase}${suffix}
    make
}

package() {
    cd "$ext_name-$pkgver"
    _priority=40
    ext_dir="$(php-config${phpbase}${suffix} --extension-dir)"
    _ini_dir="/etc/php${phpbase}${suffix}/conf.d"
    _ini_file="${_ini_dir}/${_priority}-${ext_name}.ini"
    install -m0755 -d "${pkgdir}/${_ini_dir}"
    echo "zend_extension=${ext_name}.so" > "${pkgdir}/${_ini_file}"
    chmod 0644 "${pkgdir}/${_ini_file}"
    install -m0755 -D ".libs/${ext_name}.so" "${pkgdir}/${ext_dir}/${ext_name}.so"
}

sha256sums=('55f6ef381245da079b2fc5ce1cfbcb7961197d0c0e04f9d977613cf9aa969a79')
sha256sums=('55f6ef381245da079b2fc5ce1cfbcb7961197d0c0e04f9d977613cf9aa969a79')
