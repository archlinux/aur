# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-seapi-git
pkgver=17.01.28.r21.g16904d4
pkgrel=1
pkgdesc='Intel Single Event API (Intel SEAPI) (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/IntelSEAPI/'
license=('BSD' 'GPL')
depends=('gcc-libs')
makedepends=('git' 'python' 'cmake' 'java-environment' 'classpath')
optdepends=('python: for using runtool scripts')
provides=('intel-seapi' 'intel-ittnotify' 'intel-ittnotify-git')
conflicts=('intel-seapi' 'intel-ittnotify' 'intel-ittnotify-git')
source=("$pkgname"::'git+https://github.com/intel/IntelSEAPI.git')
sha256sums=('SKIP')

[ "$CARCH" = 'i686'   ] && _architecture='32'
[ "$CARCH" = 'x86_64' ] && _architecture='64'

prepare() {
    cd "$pkgname"
    
    # set install prefix
    if ! grep -q "(\"\-DCMAKE_INSTALL_PREFIX:PATH='/usr'\"),$" buildall.py
    then
        sed -i "282i\            \(\"-DCMAKE_INSTALL_PREFIX:PATH='/usr'\")," buildall.py
    fi
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
}

build() {
    cd "$pkgname"
    
    python ./buildall.py --force_bits "$_architecture"
}

package() {
    cd "${pkgname}/build_linux/${_architecture}"
    make DESTDIR="$pkgdir" install
    
    mv -f "${pkgdir}/usr/bin/libIntelSEAPI${_architecture}.so" "${pkgdir}/usr/lib"
    
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv -f "$pkgdir"/usr/runtool/* "${pkgdir}/usr/share/${pkgname}"
    rm -rf "${pkgdir}/usr/runtool"
    
    rm -f "${pkgdir}/usr/README.txt"
    
    # license
    cd "${srcdir}/${pkgname}/ittnotify/src/ittnotify"
    install -D -m644 LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
