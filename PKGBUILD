# Maintainer: ml <ml@visu.li>
# Contributor: 1ridic <i at 8f dot al>
pkgbase=lpac
pkgname=(lpac libeuicc)
pkgver=2.3.0
pkgrel=1
pkgdesc="C-based eUICC LPA"
arch=('x86_64')
url=https://github.com/estkme-group/lpac
#license=('AGPL-3.0-only' 'LGPL-2.1-only')
makedepends=('cmake' 'gcc' 'git' 'pcsclite' 'libcurl.so' 'libpcsclite.so')
depends=('glibc')
#source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
source=(git+"$url".git#tag=v"$pkgver")
sha256sums=('4a6c994a0331a096504ecefad9bda42d6c05d705f516339209d4d4e6e135cb90')

build() {
    cmake -G 'Unix Makefiles' \
        -B build \
        -S "$pkgbase" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_BUILD_RPATH:BOOL=TRUE \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL=TRUE \
        -DLPAC_DYNAMIC_DRIVERS:BOOL=TRUE \
        -DLPAC_DYNAMIC_LIBEUICC:BOOL=TRUE \
        -Wno-dev
    cmake --build build
}

package_libeuicc() {
    license=('LGPL-2.1-only')
    provides=('libeuicc.so')

    DESTDIR="$pkgdir" cmake --install build/euicc

    cd "$pkgbase"
    install -Dm644 euicc/LICENSE "$pkgdir"/usr/share/licenses/libeuicc/LICENSE
    install -m644 cjson/LICENSE "$pkgdir"/usr/share/licenses/libeuicc/LICENSE-cjson
}

package_lpac() {
    license=('AGPL-3.0-only')
    depends+=('curl' 'libcurl.so' 'libeuicc' 'libpcsclite.so' 'ccid')
    provides=('libeuicc-drivers.so')

    DESTDIR="$pkgdir" cmake --install build/driver
    DESTDIR="$pkgdir" cmake --install build/src

    cd "$pkgbase"
    install -Dm644 docs/{USAGE,ENVVARS,FAQ}.md -t "$pkgdir"/usr/share/doc/lpac
    install -Dm644 src/LICENSE "$pkgdir"/usr/share/licenses/lpac/LICENSE
    install -m644 cjson/LICENSE "$pkgdir"/usr/share/licenses/lpac/LICENSE-cjson
}
