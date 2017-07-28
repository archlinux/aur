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

sha256sums=('a6bd6faffb29e308ef8f977e27a526ff05dd60d68a72f6377462f9546c1c544a')

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

