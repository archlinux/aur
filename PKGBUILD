# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=isobmff-git
pkgver=r128.7802f2e
pkgrel=1
pkgdesc='Library for reading/parsing files in the ISO Base Media File Format (git version)'
arch=('i686' 'x86_64')
url='https://github.com/DigiDNA/ISOBMFF/'
license=('MIT')
depends=(
    # AUR:
        'libc++'
)
makedepends=('git' 'clang')
provides=('isobmff')
conflicts=('isobmff')
source=("$pkgname"::'git+https://github.com/DigiDNA/ISOBMFF.git'
        'submodule-PIMPL'::'git+https://github.com/macmade/PIMPL.git'
        'submodule-gmock-xcode'::'git+https://github.com/macmade/gmock-xcode.git'
        'submodule-makelib'::'git+https://github.com/macmade/makelib.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"
    
    local _submodule_list='PIMPL gmock-xcode makelib'
    
    git submodule init
    
    for _submodule in $_submodule_list
    do
        git config --local "submodule.Submodules/${_submodule}.url" "${srcdir}/submodule-${_submodule}"
    done
    
    unset _submodule
    git submodule update
}

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    # includes
    cd "${pkgname}/ISOBMFF/include"
    mkdir -p "${pkgdir}/usr/include/ISOBMFF"
    install -m644 *.hpp "${pkgdir}/usr/include"
    cd ISOBMFF
    install -m644 *.hpp "${pkgdir}/usr/include/ISOBMFF"
    
    # library
    cd "${srcdir}/${pkgname}/Build/Release/Products/${CARCH}"
    install -D -m755 libISOBMFF.so "${pkgdir}/usr/lib/libISOBMFF.so"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
