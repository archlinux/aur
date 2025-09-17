# Maintainer: Maks Verver <maks@verver.ch>

pkgname=unzip_p
pkgver=6.0.2
_tag=${pkgver}  # add -rc.N for release testing
_name=unzip-p-${_tag}
pkgrel=2
pkgdesc='unzip with patches'
url='https://github.com/maksverver/unzip-p/'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'bash')
conflicts=('unzip')
provides=('unzip')
source=(${_name}.tar.gz::https://github.com/maksverver/unzip-p/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('e9076b81179269c64c7393d4b05d88181b88c03c99d476982b57c9e96bb44868')

build() {
    cd "${srcdir}/${_name}"

    make \
        CFLAGS_EXTRA="$CFLAGS $DEBUG_CFLAGS -DUSE_BZIP2" \
        LDLIBS_EXTRA="-lbz2" \
        LDFLAGS_EXTRA="$LDFLAGS" \
        prefix="/usr" -j all
}

check() {
    cd "${srcdir}/${_name}"

    make check
}

package() {
    cd "${srcdir}/${_name}"

    make prefix="/usr" DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
