# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r268.gcf0c9c9
pkgrel=2
pkgdesc='Useful tools for I2P (git version)'
arch=('x86_64')
url='https://github.com/PurpleI2P/i2pd-tools/'
license=('BSD-3-Clause')
depends=('boost-libs' 'openssl' 'python' 'zlib')
makedepends=('git' 'boost')
provides=('i2pd-tools')
conflicts=('i2pd-tools')
source=('git+https://github.com/PurpleI2P/i2pd-tools.git'
        'git+https://github.com/PurpleI2P/i2pd.git'
        '010-i2pd-tools-use-arch-flags.patch')
sha256sums=('SKIP'
            'SKIP'
            'fb2eba0fbc3a9ce5d39c099561bc56ba9f39dbed540b7f0fcd3377c426533300')

prepare() {
    git -C i2pd-tools submodule init
    git -C i2pd-tools config --local submodule.i2pd.url "${srcdir}/i2pd"
    git -C i2pd-tools -c protocol.file.allow='always' submodule update
    
    chmod a-x i2pd-tools/{*.{cpp,hpp,md},dependencies.sh,Makefile}
    
    patch -d i2pd-tools -Np1 -i "${srcdir}/010-i2pd-tools-use-arch-flags.patch"
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
    
    install -D -m755 i2pd-tools/scripts/i2pdctl -t "${pkgdir}/usr/bin"
    install -D -m644 i2pd-tools/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
