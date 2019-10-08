# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r192.g84dcb08
pkgrel=1
pkgdesc='Tools for I2P (git version)'
arch=('x86_64')
url='https://github.com/PurpleI2P/i2pd-tools/'
license=('BSD')
depends=('i2pd' 'openssl')
makedepends=('git' 'boost')
provides=('i2pd-tools')
conflicts=('i2pd-tools')
source=('git+https://github.com/PurpleI2P/i2pd-tools.git'
        '010-i2pd-tools-use-shared-lib.patch'
        '020-i2pd-tools-use-arch-flags.patch')
sha256sums=('SKIP'
            '54d228514c60ea3c805520693cad3dc09fb3bdb52fe437619a69be3655d52c90'
            '6ac88fa5262ae43a225e89090fc0fc039af46f8afc04faba83c9eea9bb23486c')

prepare() {
    patch -d i2pd-tools -Np1 -i "${srcdir}/010-i2pd-tools-use-shared-lib.patch"
    patch -d i2pd-tools -Np1 -i "${srcdir}/020-i2pd-tools-use-arch-flags.patch"
}

pkgver() {
    cd i2pd-tools
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make -C i2pd-tools
}

package() {
    cd i2pd-tools
    
    local _tool
    while read -r -d '' _tool
    do
        _tool="${_tool##*/}"
        _tool="${_tool%.cpp}"
        install -D -m755 "${_tool}" "${pkgdir}/usr/bin/i2pd-${_tool}"
    done < <(find -maxdepth 1 -type f -name '*.cpp' ! -name 'vanitygen.cpp' -print0)
    
    install -D -m755 vain "${pkgdir}/usr/bin/i2pd-vain"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
