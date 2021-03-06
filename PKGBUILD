# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r210.g86234df
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
            'bddc47db8dd1976504038253c3565b72d06507572f1e428de7af4eb27dea54b0'
            '237df04a9137c0f7db6bc1d9afde2616e332aeb62fb62f6998c48a05c2aab759')

prepare() {
    patch -d i2pd-tools -Np1 -i "${srcdir}/010-i2pd-tools-use-shared-lib.patch"
    patch -d i2pd-tools -Np1 -i "${srcdir}/020-i2pd-tools-use-arch-flags.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C i2pd-tools rev-list --count HEAD)" "$(git -C i2pd-tools rev-parse --short HEAD)"
}

build() {
    make -C i2pd-tools
}

package() {
    local _tool
    while read -r -d '' _tool
    do
        install -D -m755 "$_tool" "${pkgdir}/usr/bin/i2pd-${_tool##*/}"
    done < <(find i2pd-tools -maxdepth 1 -type f -executable -print0)
    
    install -D -m755 i2pd-tools/vain "${pkgdir}/usr/bin/i2pd-vain"
    install -D -m644 i2pd-tools/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
