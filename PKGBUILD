# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=IntelSEAPI
pkgname=intel-seapi-git
pkgver=17.01.28.r25.gf41831f
pkgrel=3
pkgdesc='Intel Single Event API (Intel SEAPI) (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/IntelSEAPI/'
license=('BSD' 'GPL')
depends=('gcc-libs')
makedepends=('git' 'python' 'cmake' 'java-environment' 'classpath')
optdepends=('python: for using runtool modules')
provides=('intel-seapi' 'intel-ittnotify' 'intel-ittnotify-git')
conflicts=('intel-seapi' 'intel-ittnotify' 'intel-ittnotify-git')
source=('git+https://github.com/intel/IntelSEAPI.git'
        'intel-seapi-git-change-install-prefix.patch')
sha256sums=('SKIP'
            '2b8b415490503e19bbd432b0dc958ca9b4ee154dcfd1e97642e3025a7d6c9d7e')

[ "$CARCH" = 'i686'   ] && _architecture='32'
[ "$CARCH" = 'x86_64' ] && _architecture='64'

prepare() {
    cd "$_srcname"
    
    # change install prefix to '/usr' instead of '/usr/local'
    patch -Np1 -i "${srcdir}/intel-seapi-git-change-install-prefix.patch"
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
}

build() {
    cd "$_srcname"
    
    python ./buildall.py --force_bits "$_architecture"
}

package() {
    cd "${_srcname}/build_linux/${_architecture}"
    
    make DESTDIR="$pkgdir" install
    
    # library
    mv -f "${pkgdir}/usr/bin/libIntelSEAPI${_architecture}.so" "${pkgdir}/usr/lib"
    
    # python
    local _pythonver="$(python --version | sed 's/^Python[[:space:]]//' | grep -o '^[0-9]*\.[0-9]*')"
    mkdir -p "${pkgdir}/usr/lib/python${_pythonver}/${pkgname%%-git}"
    mv -f "$pkgdir"/usr/runtool/* "${pkgdir}/usr/lib/python${_pythonver}/${pkgname%%-git}"
    
    # cleanup
    rm -rf "${pkgdir}/usr/runtool"
    rm -f "${pkgdir}/usr/README.txt"
    
    # license
    cd "${srcdir}/${_srcname}/ittnotify/src/ittnotify"
    install -D -m644 LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
