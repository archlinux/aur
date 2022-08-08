# Maintainer: Arisu <arisuuwu32@gmail.com>

pkgname="zeroc-ice-php"
pkgver=3.7.8
pkgrel=1
pkgdesc="PHP bindings for Ice RPC framework"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "zeroc-ice=$pkgver"
    "php"
)

depends=("zeroc-ice=$pkgver" "php")

source=("ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz")

sha256sums=('f2ab6b151ab0418fab30bafc2524d9ba4c767a1014f102df88d735fc775f9824')

make_args=(
    "OPTIMIZE=yes"
    "ICE_HOME=/usr/" 
    "ICE_BIN_DIST=cpp"
)

build() {
    cd ${srcdir}/ice-${pkgver}/php
    msg "Building Ice for PHP"
    msg2 "Compiling..."
    make "${make_args[@]}" -j$(nproc) srcs
}

package() {
    cd ${srcdir}/ice-${pkgver}/php
    make install ${make_args[@]} DESTDIR="${pkgdir}" "install_phpdir=/usr/share/ice/php" "install_phplibdir=/usr/lib/php/modules"

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php/conf.d/
    echo "extension = ice.so" > ${pkgdir}/etc/php/conf.d/zeroc-ice.ini
    echo "include_path=${include_path}:/usr/share/ice/php/" >> ${pkgdir}/etc/php/conf.d/zeroc-ice.ini
}

