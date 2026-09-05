# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgbase=libgourou
pkgname=(libgourou libgourou-utils)
pkgver=0.8.10
pkgrel=1
pkgdesc="Free implementation of Adobe's ADEPT protocol used to add DRM on ePub/PDF files"
arch=('any')
url="https://forge.soutade.fr/soutade/libgourou"
license=('LGPL-3.0-or-later AND BSD-3-Clause')
makedepends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'updfparser'
    'pugixml'
    'curl'
    'openssl>=3'
    'libzip'
    'zlib'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4ea8d614b6731b9c3b5280196a4b94f8a588cb932f2ed7d27cf05c18c969f099')

build() {
    cd libgourou
    make \
        BUILD_STATIC=0 \
        BUILD_SHARED=1 \
        UPDFPARSERLIB="/dev/null" \
        LDFLAGS="-lpugixml -lupdfparser -Wl,-z,relro,-z,now" \
        obj libgourou

    cd utils
    make ROOT=..
}

package_libgourou() {
    license=('LGPL-3.0-or-later')
    depends=(
        'glibc'
        'libgcc'
        'libstdc++'
        'updfparser'
        'pugixml'
    )
    cd libgourou

    install -Dm755 "libgourou.so.$pkgver" -t "$pkgdir/usr/lib"
    ln -s "libgourou.so.$pkgver" "$pkgdir/usr/lib/libgourou.so"
    make DESTDIR="$pkgdir" PREFIX="/usr" install_headers
}

package_libgourou-utils() {
    license=('BSD-3-Clause')
    depends=(
        'libgourou'
        'pugixml'
        'glibc'
        'libgcc'
        'libstdc++'
        'curl'
        'openssl>=3'
        'libzip'
        'zlib'
    )
    cd libgourou/utils

    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/libgourou-utils/"
}
