# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r210.g86234df
pkgrel=2
pkgdesc='Useful tools for I2P (git version)'
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
            '5a55fadba532186662b5d6be163b49ade2e028560a717c542fd6589e205f3131'
            '1cb37e701be90280debde4440e16dd4e64d7024707e4e07bee9e78e40829fb00')

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
    
    install -D -m644 i2pd-tools/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
