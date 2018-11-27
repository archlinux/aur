# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=isobmff-git
_srcname=ISOBMFF
pkgver=r135.4f0e8e0
pkgrel=2
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
source=('git+https://github.com/DigiDNA/ISOBMFF.git'
        'git+https://github.com/macmade/PIMPL.git'
        'git+https://github.com/macmade/gmock-xcode.git'
        'git+https://github.com/macmade/makelib.git'
        'git+https://github.com/macmade/xcconfig.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$_srcname"
    
    local _submodule
    local _submodule_list='PIMPL gmock-xcode makelib xcconfig'
    
    git submodule init
    
    for _submodule in $_submodule_list
    do
        git config --local "submodule.Submodules/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    git submodule update
}

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_srcname"
    
    local _ldflags_orig
    _ldflags_orig="$(grep 'CC_FLAGS_DYLIB_' Submodules/makelib/Platform/Linux.mk | awk -F':=' '{ print $2 }')"
    
    make CC_FLAGS_${CARCH}+="$CXXFLAGS" CC_FLAGS_DYLIB_${CARCH}="${LDFLAGS} ${_ldflags_orig}"
}

package() {
    # includes
    cd "${_srcname}/ISOBMFF/include"
    mkdir -p "${pkgdir}/usr/include/ISOBMFF"
    install -m644 *.hpp "${pkgdir}/usr/include"
    install -m644 ISOBMFF/*.hpp "${pkgdir}/usr/include/ISOBMFF"
    
    # library
    cd "${srcdir}/${_srcname}/Build/Release/Products/${CARCH}"
    install -D -m755 libISOBMFF.so -t "${pkgdir}/usr/lib"
    
    # license
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
