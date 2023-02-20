# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r242.gaadc780
pkgrel=1
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
            '94d523b7fb9e32872f152c7ae76f4cb49cf142d7dde87a3df4268defb8b96481'
            '49393f88c3d9577bb82b5ccba90e3f4d6737238a32571e2b99369c9e78066adf')

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
    done < <(find i2pd-tools -maxdepth 1 -type f ! -name '*.sh' ! -name '*README*' -executable -print0)
    
    install -D -m644 i2pd-tools/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
