# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgbase=snowball-git
pkgname=(snowball-git libstemmer-git)
pkgver=2.2.0.r2.g3f8581b
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
arch=(x86_64)
url="http://snowballstem.org/"
license=(BSD)
depends=(glibc)
makedepends=(git)
source=("${pkgbase}::git+https://github.com/snowballstem/snowball"
        "dynamiclib.patch")
sha256sums=('SKIP'
            '97d21ddfd47ab4fc26cfb8b8fe9a93a3828236cd899d751b130818ca5b35580f')

prepare() {
    cd "${pkgbase}"

    rm -f libstemmer/symbol.map
    patch -f -Np1 -i ../dynamiclib.patch
}

pkgver() {
    cd "${pkgbase}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "${pkgbase}"

    make CFLAGS="-fPIC"
}

check() {
    cd "${pkgbase}"

    # Disabled - needs external test data
    #make check
}

package_snowball-git() {
    pkgname=(snowball-git)
    conflicts=(snowball)
    provides=(snowball)

    cd "${pkgbase}"

    install -d "${pkgdir}/usr/bin"
    install -t "${pkgdir}/usr/bin" snowball stemwords
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/snowball-git/LICENSE"
}

package_libstemmer-git() {
    pkgname=(libstemmer-git)
    conflicts=(libstemmer)
    provides=(libstemmer)

    pkgdesc="Stemming library supporting several languages"

    cd "${pkgbase}"

    install -Dm644 {.,"${pkgdir}"/usr}/include/libstemmer.h
    install -D {.,"${pkgdir}"/usr/lib}/libstemmer.so.0.0.0
    ln -s libstemmer.so.0.0.0 "${pkgdir}/usr/lib/libstemmer.so.0"
    ln -s libstemmer.so.0 "${pkgdir}/usr/lib/libstemmer.so"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/libstemmer-git/LICENSE"
}
