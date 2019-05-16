# Maintainer: Joe George <joe at externl dot com>

pkgname="zeroc-ice-php"
pkgver=3.7.2
pkgrel=0
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

sha256sums=('e329a24abf94a4772a58a0fe61af4e707743a272c854552eef3d7833099f40f9')

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
    make install ${make_args[@]} DESTDIR="${pkgdir}" "install_phpdir=/usr/share/ice/php" "install_phplibdir=/usr/share/ice/php"

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php/conf.d/
    echo "extension = ice.so" > ${pkgdir}/etc/php/conf.d/zeroc-ice.ini
    echo "include_path=${include_path}:/usr/share/ice/php/" >> ${pkgdir}/etc/php/conf.d/zeroc-ice.ini
}

