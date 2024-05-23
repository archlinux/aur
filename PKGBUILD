# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
_pkgname="${pkgname%2}"
pkgver=2.0.6
pkgrel=1
pkgdesc="Command-line trace converter (V2)"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('glibc' 'glib2' 'libelf')
makedepends=('asciidoc' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz"
        '0001-tests-test_dwarf.c-initialize-tag-variable.patch')
sha512sums=('fc2c99d66500fd369aa353a77ddef5e1f5d06c6143c91fde5628dbaf1822897d32b60179db44f7dcf340d5e615fa8fe7246b6a23ee5ddaace69a2b462ed899b6'
            'b3e9ea5fc7c92d8d8b1bdb957f7bcf9ddc5cee6585f61c1cb5b6ef3d3ef83146ef85c599b8c7e707ca85e7295c0152a0b0e90d5597427fd5bace556b66768e90')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input=../0001-tests-test_dwarf.c-initialize-tag-variable.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr' --enable-debug-info
    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
