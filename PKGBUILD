# Maintainer: Soham Sen <aur at sohamsen dot me>

pkgname=nginx-mod-mime-magic
_name=nginx-mime-magic-module
_libname=ngx_http_mime_magic_module
pkgver=0.1.0
pkgrel=1
pkgdesc='Set Content-Type mime-type automatically from the magic bytes of some file! (Similar to file(1))'
arch=('x86_64')
url="https://github.com/Yureien/${_name}"
license=('BSD')
depends=('nginx' 'file')
makedepends=('nginx-src' 'make')
source=("${_name}-${pkgver}.tar.gz::https://github.com/FadedCoder/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('9e7e865a99c2a99af720ec3269128a11f74b6fae0cdcdda396522ec5c06108ff')

build() {
    cp -r /usr/src/nginx .
    cd "${srcdir}/nginx"
    ./configure \
        --with-compat \
        --with-ld-opt="-lmagic" \
        --add-dynamic-module="../${_name}-${pkgver}"
    make modules
}

package() {
    install -Dm755 -t "${pkgdir}/usr/lib/nginx/modules/" "${srcdir}/nginx/objs/${_libname}.so"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${_name}-${pkgver}/LICENSE"
}
