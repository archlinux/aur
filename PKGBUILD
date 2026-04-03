# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname='pyswisseph'
pkgver='2.10.03.2'
pkgrel=2
pkgdesc='Python extension to the Swiss Ephemeris.'
arch=('i686' 'x86_64' 'aarch64')
license=('AGPL-3.0-only')
url='https://github.com/astrorigin/pyswisseph'
depends=('python' 'sqlite3')
makedepends=('git' 'cmake')
conflicts=('pyswisseph3' 'pyswisseph-git')
provides=('pyswisseph')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "swisseph-2.10.03.tar.gz::https://github.com/aloistr/swisseph/archive/refs/tags/v2.10.03.tar.gz"
        "git+https://github.com/astrorigin/swephelp.git")
sha256sums=('c70ef4bc2526787146f8394eebbbdaa012eea9d9c32110b80e6eb5dfc9922e31'
            '8c166796767a560691581575b6eb4b4383d849e542b16647dca2e0b127fb70b0'
            'SKIP')

prepare() {
    #first, extract swisseph into "${srcdir}/${pkgname}-${pkgver}/libswe":
    rmdir "${srcdir}/${pkgname}-${pkgver}/libswe"
    tar -xzf "swisseph-2.10.03.tar.gz" --directory "${srcdir}/${pkgname}-${pkgver}"    
    mv "${srcdir}/${pkgname}-${pkgver}/swisseph-2.10.03" "${srcdir}/${pkgname}-${pkgver}/libswe"
    
    #then rename "${srcdir}/swephelp" as "${srcdir}/${pkgname}-${pkgver}/swephelp"
    rmdir "${srcdir}/${pkgname}-${pkgver}/swephelp"
    mv "${srcdir}/swephelp" "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    #build the swisseph (probably not necessary):
    #cd "${srcdir}/${pkgname}-${pkgver}/libswe"
    #make all
    
    #build swephelp (again, possibly not necessary):
    #cd "${srcdir}/${pkgname}-${pkgver}/swephelp"
    #cmake -B build_dir -S . -G Ninja \
    #    -DCMAKE_INSTALL_PREFIX='/usr' \
    #    -DCMAKE_BUILD_TYPE=Release
    #cmake --build build_dir
    
    # build pyswisseph:
    cd "${srcdir}/${pkgname}-${pkgver}"
    make build
}

package() {
    cd $pkgdir
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root=$pkgdir || return 1
}
