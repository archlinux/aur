# Maintainer: Maks Verver <maks@verver.ch>

pkgname=unzip-p
pkgver=6.0.2
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
sha256sums=('caf1c130b5b23e49b488e1716aeeb4c6d075a0f7878c2c91277ba30ddc3b3da0')

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
