# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=3proxy
pkgname=${_pkgname}-standalone
pkgver=0.9.4
pkgrel=1
pkgdesc="Standalone HTTP/SOCKS proxy binaries from 3proxy proxy server"
arch=('x86_64')
url="https://github.com/z3APA3A/3proxy"
license=('GPL')
depends=('glibc')
makedepends=('gcc' 'make')
source=("https://github.com/z3APA3A/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b497f74d6cc7ee58ff824457427acc02c6f7a102e483816fbb1b2494942ef983')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # O2 and march should be dound in makepkg.conf.
    sed --follow-symlinks -i.bak -e 's| -O2||g;s|CFLAGS = -g|CFLAGS =|;s|CC = gcc|CC ?= gcc|;s|LN = gcc|LN ?= gcc|' Makefile.Linux
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make prefix="/usr" \
         DESTDIR="${pkgdir}" \
    -f Makefile.Linux
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make prefix="/usr" install \
         DESTDIR="${pkgdir}" \
    -f Makefile.Linux

    rm -rf "${pkgdir}/etc" \
           "${pkgdir}/var" \
           "${pkgdir}/usr/lib" \
           "${pkgdir}/usr/local" \
           "${pkgdir}/usr/share"

    find "${pkgdir}/usr/bin" \
        -maxdepth 1 \
        -type f \
      ! -name "proxy" \
      ! -name "socks" \
        -delete;

    ls -1 "${pkgdir}/usr/bin" | \
        xargs -I{} mv "${pkgdir}/usr/bin/{}" "${pkgdir}/usr/bin/${_pkgname}_{}"

    install -D -m644 copying "${pkgdir}${_prefix}/share/licenses/$pkgname/copying"
}
