# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=fxdiv-git
_srcname=FXdiv
pkgver=r53.f8c5354
pkgrel=1
pkgdesc='Header-only library for division via fixed-point multiplication by inverse (git version)'
arch=('any')
url='https://github.com/Maratyszcza/FXdiv/'
license=('MIT')
makedepends=('git')
checkdepends=(
     # official repositories:
        'python2' 'ninja'
     # AUR:
        'confu2-git'
)
provides=('fxdiv')
conflicts=('fxdiv')
source=('git+https://github.com/Maratyszcza/FXdiv.git')
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
    ninja
    
    cd bin
    local _test
    for _test in *
    do
        printf '%s\n' "  -> Running test '${_test}'..."
        ./"$_test"
    done
}

package() {
    cd "$_srcname"
    
    # headers
    mkdir -p "${pkgdir}/usr/include"
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
