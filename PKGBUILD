# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core
pkgname=('lightway-core' 'lightway-core-doc')
pkgver=1.8.5
pkgrel=1
pkgdesc='A VPN protocol by ExpressVPN'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL2')
makedepends=('git' 'ruby-ceedling' 'doxygen' 'graphviz')
source=("https://github.com/expressvpn/lightway-core/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'git+https://github.com/wolfSSL/wolfssl.git'
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('d607cd654dffd056d40413b48e6845cc92e008ad2823cecade294d252ba95fdd'
            'SKIP'
            'fd82affc9e605a7963e5b4908d8decc877980ac007f9ba5aabeccf9019cf5727')

prepare() {
    local _wolfssl_commit
    _wolfssl_commit="$(awk '/he_wolfssl_commit/ { print $3 }' "${pkgname}-${pkgver}/unix.yml")"
    git -C wolfssl config --local advice.detachedHead false
    git -C wolfssl checkout --quiet "$_wolfssl_commit"
    
    patch -d wolfssl -Np1 -i "${srcdir}/010-lightway-core-disable-werror-on-wolfssl.patch"
    
    mkdir -p "${pkgname}-${pkgver}/third_party"
    cp -af wolfssl "${pkgname}-${pkgver}/third_party"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    [ -z "$LC_ALL" ] && export LC_ALL='C'
    cd "${pkgname}-${pkgver}"
    ceedling release project:linux
    doxygen
}

check() {
    cd "${pkgname}-${pkgver}"
    ceedling test project:linux
}

package_lightway-core() {
    install -D -m644 "${pkgname}-${pkgver}/build/release"/*.a -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}/public" "${pkgdir}/usr/include"
}

package_lightway-core-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' "lightway-core-${pkgver}/html" "${pkgdir}/usr/share/doc/lightway-core"
}
