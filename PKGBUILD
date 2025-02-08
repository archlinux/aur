# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=i2pd-tools-git
pkgver=r282.ga596d1f
pkgrel=1
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
        '010-i2pd-tools-use-arch-flags.patch'
        '020-i2pd-tools-i2pd-remove-aesni-from-InitCrypto.patch')
sha256sums=('SKIP'
            'SKIP'
            '840e4aae34262cf657a0162540dcdf1a3ef0fdaf05b7d162f179c5575329e8a5'
            'f59b348567a6d7a46ce77a9ab5671dccd41844e34f22e5e989fea3db196bcdf0')

prepare() {
    git -C i2pd-tools submodule init
    git -C i2pd-tools config --local submodule.i2pd.url "${srcdir}/i2pd"
    git -C i2pd-tools -c protocol.file.allow='always' submodule update
    
    chmod a-x i2pd-tools/{*.{cpp,hpp,md},dependencies.sh,Makefile}
    
    patch -d i2pd-tools -Np1 -i "${srcdir}/010-i2pd-tools-use-arch-flags.patch"
    
    local _date
    _date="$(TZ='UTC' date -d "$(git -C i2pd-tools/i2pd log -1 --date='short' --pretty='format:%ci')" '+%Y%m%d')"
    
    if [ "$_date" -lt '20241215' ]
    then
        git -C i2pd-tools/i2pd config --local advice.detachedHead false
        git -C i2pd-tools/i2pd checkout 833e0a936eb8cba2937a4421d554aecb555f5a02
        patch -d i2pd-tools -Np1 -i "${srcdir}/020-i2pd-tools-i2pd-remove-aesni-from-InitCrypto.patch"
    fi
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
