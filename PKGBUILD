# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core
pkgname=('lightway-core' 'lightway-core-doc')
pkgver=1.14.7
pkgrel=1
pkgdesc='A VPN protocol by ExpressVPN'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL2')
makedepends=('git' 'cmake' 'ruby-ceedling' 'doxygen' 'graphviz')
source=("https://github.com/expressvpn/lightway-core/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'git+https://github.com/open-quantum-safe/liboqs.git'
        'git+https://github.com/wolfSSL/wolfssl.git'
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('50a6ca02acf6a458e622466f984dc35ad44d78365ede69269efd9f6c6bd62ae7'
            'SKIP'
            'SKIP'
            'fd82affc9e605a7963e5b4908d8decc877980ac007f9ba5aabeccf9019cf5727')

prepare() {
    local _liboqs_tag
    local _wolfssl_tag
    _liboqs_tag="$(awk '/HE_LIBOQS_TAG/ { print $3 }' "${pkgname}-${pkgver}/3rd_party_deps.yml")"
    _wolfssl_tag="$(awk '/HE_WOLFSSL_TAG/ { print $3 }' "${pkgname}-${pkgver}/3rd_party_deps.yml")"
    git -C liboqs config --local advice.detachedHead false
    git -C liboqs checkout --quiet "$_liboqs_tag"
    git -C wolfssl config --local advice.detachedHead false
    git -C wolfssl checkout --quiet "$_wolfssl_tag"
    
    patch -d wolfssl -Np1 -i "${srcdir}/010-lightway-core-disable-werror-on-wolfssl.patch"
    
    mkdir -p "${pkgname}-${pkgver}/third_party"
    cp -af liboqs wolfssl "${pkgname}-${pkgver}/third_party"
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
