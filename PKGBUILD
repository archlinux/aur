ext_name=xdebug
phpbase=53
suffix=
pkgname="php${phpbase}-${ext_name}${suffix}"
pkgver=2.2.7
source=("http://pecl.php.net/get/$ext_name-$pkgver.tgz")
pkgrel=1
pkgdesc="php${phpbase}${suffix} Xdebug extension"
arch=("x86_64" "i686")
url="https://xdebug.org/"
license=('Xdebug')
makedepends=("php${phpbase}${suffix}")
backup=()

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
    backup+=("${_ini_file}")
    install -m0755 -d "${pkgdir}/${_ini_dir}"
    echo "zend_extension=${ext_name}.so" > "${pkgdir}/${_ini_file}"
    chmod 0644 "${pkgdir}/${_ini_file}"
    install -m0755 -D ".libs/${ext_name}.so" "${pkgdir}/${ext_dir}/${ext_name}.so"
}

sha256sums=('4fce7fc794ccbb1dd0b961191cd0323516e216502fe7209b03711fc621642245')
