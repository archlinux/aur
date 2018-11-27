# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=IntelSEAPI
pkgname=intel-seapi
pkgver=17.01.28
pkgrel=6
pkgdesc='Intel Single Event API (Intel SEAPI)'
arch=('i686' 'x86_64')
url='https://github.com/intel/IntelSEAPI/'
license=('BSD' 'GPL')
depends=('gcc-libs')
makedepends=('python' 'cmake' 'java-environment' 'classpath')
optdepends=('python: for using runtool modules')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/IntelSEAPI/archive/${pkgver}.tar.gz"
        'intel-seapi-change-install-prefix.patch')
sha256sums=('57020dfa8b5c1a62a3700e0c93a60011a42b6ec4b80824510aaaa830a256c76b'
            '5a4666d324f11e8c57b51aa1e4680d77790f3449cb319f4cf9223c25dce0d1a0')

[ "$CARCH" = 'i686'   ] && _architecture='32'
[ "$CARCH" = 'x86_64' ] && _architecture='64'

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # change install prefix to '/usr' instead of '/usr/local'
    patch -Np1 -i "${srcdir}/intel-seapi-change-install-prefix.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    
    python ./buildall.py --force_bits "$_architecture"
}

package() {
    cd "${_srcname}-${pkgver}/build_linux/${_architecture}"
    
    make DESTDIR="$pkgdir" install
    
    # library
    mv "${pkgdir}/usr/bin/libIntelSEAPI${_architecture}.so" "${pkgdir}/usr/lib"
    
    # python
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" % sys.version_info[:2])')"
    mkdir -p "${pkgdir}/usr/lib/python${_pythonver}/${pkgname}"
    mv "$pkgdir"/usr/runtool/* "${pkgdir}/usr/lib/python${_pythonver}/${pkgname}"
    
    # cleanup
    rm -r "${pkgdir}/usr/runtool"
    rm    "${pkgdir}/usr/README.txt"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}/ittnotify/src/ittnotify"
    install -D -m644 LICENSE.BSD -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
