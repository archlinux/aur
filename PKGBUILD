# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=crossc-git
pkgver=1.6.0.r0.g98689d7
pkgrel=4
pkgdesc='Portable C wrapper for SPIRV-Cross (git version)'
arch=('x86_64')
url='https://github.com/rossy/crossc/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('git')
provides=('crossc')
conflicts=('crossc')
source=('git+https://github.com/rossy/crossc.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd crossc
    
    git submodule init
    git config --local 'submodule.SPIRV-Cross.url' "${srcdir}/SPIRV-Cross"
    git submodule update
}

pkgver() {
    cd crossc
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd crossc
    
    make
}

package() {
    cd crossc
    
    local _file
    local _lib
    local _soname
    local _somaj
    local _sover
    
    make DESTDIR="$pkgdir" prefix='/usr' install
    
    cd "${pkgdir}/usr/lib"
    
    # create missing symbolic link
    while read -rd '' _file
    do
        _lib="${_file##*/}"
        _soname="${_lib%%.*}"
        _sover="${_lib##*.so.}"
        _somaj="${_sover%%.*}"
        
        ln -s "${_lib}" "${_soname}.so.${_somaj}"
        
    done < <(find . -type f -name 'lib*.so.*.*.*' -print0)
}
