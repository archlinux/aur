# Maintainer: Maks Verver <maks@verver.ch>

pkgname=unzip-p
pkgver=6.0.1
_tag=${pkgver}  # add -rc.N for release testing
_name=${pkgname}-${_tag}
pkgrel=1
pkgdesc='unzip with patches'
url='https://github.com/maksverver/unzip-p/'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'bash')
conflicts=('unzip')
provides=('unzip')
source=(${_name}.tar.gz::https://github.com/maksverver/unzip-p/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('d74f0a189412651508627a01dce3fe429230083ed07a0d39a97a41fc8d3a0e85')

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
