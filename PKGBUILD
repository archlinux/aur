# Maintainer: Joe George <joe at externl dot com>

pkgname="zeroc-ice-php56"
pkgver=3.7.0
pkgrel=1
pkgdesc="PHP bindings for Ice RPC framework"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "zeroc-ice=$pkgver"
    "php56"
)

depends=("zeroc-ice=$pkgver" "php56")

source=("ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz")

sha256sums=('809fff14a88a7de1364c846cec771d0d12c72572914e6cc4fb0b2c1861c4a1ee')

make_args=(
    "OPTIMIZE=yes"
    "USR_DIR_INSTALL=yes"
    "ICE_BIN_DIST=cpp"
    "ICE_HOME=/usr"
    "LANGUAGES=php"
    "PHP_CONFIG=php-config56"
)

build() {
    cd ${srcdir}/ice-${pkgver}
    msg "Building Ice for PHP"
    msg2 "Compiling..."

    make "${make_args[@]}" -j$(nproc) srcs
}

package() {
    cd ${srcdir}/ice-${pkgver}
    make install ${make_args[@]} DESTDIR="${pkgdir}"

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php56/conf.d/
    echo "extension = ice.so" > ${pkgdir}/etc/php56/conf.d/zeroc-ce.ini
    echo "include_path=${include_path}:/usr/share/ice/php/" >> ${pkgdir}/etc/php56/conf.d/zeroc-ice.ini

    # Move PHP source files stuff into more Arch friendly place
    mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/ice/php
}

