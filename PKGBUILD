# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
pkgver=2.1.2
pkgrel=2
pkgdesc="Trace manipulation toolkit"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('glibc' 'glib2' 'libelf' 'python')
makedepends=('asciidoc' 'xmlto' 'swig' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://www.efficios.com/files/babeltrace/babeltrace2-${pkgver}.tar.bz2"
        "swig-4.5-compat.patch")
sha512sums=('5e6b1c5c91478f5323007a6e61dff88c53062f89e58c069803ccd12ed19bb2372d6d869ee3cf51d6138b9edcebff7c09e6898c0079867aa6372a49723fa6fbbb'
            '7896eed26a3473aa1156f39fc18cf76a6c1e97b9ae0555df230901e37db59f3558c56483a7d86f8121b9e3818a23d0b7b59aa157b550742fa360cad23271e364')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # https://github.com/efficios/babeltrace/commit/b098d1ea63b2fb121c73ca1087e539c11894dff9
    patch -Np1 -i "${srcdir}/swig-4.5-compat.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr' --enable-debug-info --enable-python-bindings --enable-python-plugins
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
