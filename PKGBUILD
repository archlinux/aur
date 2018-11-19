# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=fp16-git
_srcname=FP16
pkgver=r40.34d4bf0
pkgrel=3
pkgdesc='Header-only library for conversion to/from half-precision floating point formats (git version)'
arch=('any')
url='https://github.com/Maratyszcza/FP16/'
license=('MIT')
makedepends=('git')
checkdepends=(
     # official repositories:
        'python2' 'ninja'
     # AUR:
        'confu2-git' 'python2-peachpy-git'
)
provides=('fp16')
conflicts=('fp16')
source=('git+https://github.com/Maratyszcza/FP16.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "$_srcname"
    confu2 setup
    python2 ./configure.py
    sed -i '/peachpy[[:space:]]=[[:space:]]python/s/python/python2/' build.ninja # use python2
    ninja
    
    cd bin
    local _test
    for _test in *
    do
        if [[ "$_test" = alt-to-fp32*-psimd ]] ||
           [[ "$_test" = ieee-to-fp32*-psimd ]]
        then
            # skip broken tests
            printf '%s\n' "  -> Skipping test '${_test}'..."
            continue
        else
            printf '%s\n' "  -> Running test '${_test}'..."
            ./"$_test"
        fi
    done
}

package() {
    cd "$_srcname"
    
    # headers
    mkdir -p "${pkgdir}/usr/include/fp16"
    install -D -m644 include/*.h      "${pkgdir}/usr/include"
    install -D -m644 include/fp16/*.h "${pkgdir}/usr/include/fp16"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
