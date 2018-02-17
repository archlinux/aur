# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=IntelSEAPI
pkgname=intel-seapi
pkgver=17.01.28
pkgrel=1
pkgdesc='Intel Single Event API (Intel SEAPI)'
arch=('i686' 'x86_64')
url='https://github.com/intel/IntelSEAPI/'
license=('BSD' 'GPL')
depends=('gcc-libs')
makedepends=('python' 'cmake' 'java-environment' 'classpath')
optdepends=('python: for using runtool scripts')
provides=('intel-ittnotify')
conflicts=('intel-seapi-git' 'intel-ittnotify' 'intel-ittnotify-git')
source=("${pkgname}-${pkgver}"::"https://github.com/intel/IntelSEAPI/archive/${pkgver}.tar.gz")
sha256sums=('57020dfa8b5c1a62a3700e0c93a60011a42b6ec4b80824510aaaa830a256c76b')

[ "$CARCH" = 'i686'   ] && _architecture='32'
[ "$CARCH" = 'x86_64' ] && _architecture='64'

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # set install prefix
    if ! grep -q "(\"\-DCMAKE_INSTALL_PREFIX:PATH='/usr'\"),$" buildall.py
    then
        sed -i "246i\            \(\"-DCMAKE_INSTALL_PREFIX:PATH='/usr'\")," buildall.py
    fi
}

build() {
    cd "${_srcname}-${pkgver}"
    
    python ./buildall.py --force_bits "$_architecture"
}

package() {
    cd "${_srcname}-${pkgver}/build_linux/${_architecture}"
    make DESTDIR="$pkgdir" install
    
    mv -f "${pkgdir}/usr/bin/libIntelSEAPI${_architecture}.so" "${pkgdir}/usr/lib"
    
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv -f "$pkgdir"/usr/runtool/* "${pkgdir}/usr/share/${pkgname}"
    rm -rf "${pkgdir}/usr/runtool"
    
    rm -f "${pkgdir}/usr/README.txt"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}/ittnotify/src/ittnotify"
    install -D -m644 LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
