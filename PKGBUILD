# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r268.gcf0c9c9
pkgrel=1
pkgdesc='Useful tools for I2P (git version)'
arch=('x86_64')
url='https://github.com/PurpleI2P/i2pd-tools/'
license=('BSD')
depends=('boost-libs' 'openssl' 'zlib')
makedepends=('git' 'boost')
provides=('i2pd-tools')
conflicts=('i2pd-tools')
source=('git+https://github.com/PurpleI2P/i2pd-tools.git'
        'git+https://github.com/PurpleI2P/i2pd.git'
        '010-i2pd-tools-use-shared-lib.patch'
        '020-i2pd-tools-use-arch-flags.patch')
sha256sums=('SKIP'
            'SKIP'
            '340b85de6cc8f2bc33ca3c54b6d75ddcb9b4f009e600c2d783507926c29bfae8'
            'fb2eba0fbc3a9ce5d39c099561bc56ba9f39dbed540b7f0fcd3377c426533300')

prepare() {
    git -C i2pd-tools submodule init
    git -C i2pd-tools config --local submodule.i2pd.url "${srcdir}/i2pd"
    git -C i2pd-tools -c protocol.file.allow='always' submodule update
    
    #patch -d i2pd-tools -Np1 -i "${srcdir}/010-i2pd-tools-use-shared-lib.patch"
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
