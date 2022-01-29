# Maintainer: Arisu <arisuuwu32@gmail.com>

pkgname="zeroc-ice-php"
pkgver=3.7.7
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

sha256sums=('3aef143a44a664f3101cfe02fd13356c739c922e353ef0c186895b5843a312ae')

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

