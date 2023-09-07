# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core-git
pkgname=('lightway-core-git' 'lightway-core-doc-git')
pkgver=1.14.0.r0.g1b7cb4b
pkgrel=1
pkgdesc='A VPN protocol by ExpressVPN (git version)'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL2')
makedepends=('git' 'cmake' 'ruby-ceedling' 'doxygen' 'graphviz')
source=('git+https://github.com/expressvpn/lightway-core.git'
        'git+https://github.com/open-quantum-safe/liboqs.git'
        'git+https://github.com/wolfSSL/wolfssl.git'
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'fd82affc9e605a7963e5b4908d8decc877980ac007f9ba5aabeccf9019cf5727')

prepare() {
    local _liboqs_tag
    local _wolfssl_tag
    _liboqs_tag="$(awk '/HE_LIBOQS_TAG/ { print $3 }' lightway-core/3rd_party_deps.yml)"
    _wolfssl_tag="$(awk '/HE_WOLFSSL_TAG/ { print $3 }' lightway-core/3rd_party_deps.yml)"
    git -C liboqs config --local advice.detachedHead false
    git -C liboqs checkout --quiet "$_liboqs_tag"
    git -C wolfssl config --local advice.detachedHead false
    git -C wolfssl checkout --quiet "$_wolfssl_tag"
    
    patch -d wolfssl -Np1 -i "${srcdir}/010-lightway-core-disable-werror-on-wolfssl.patch"
    
    mkdir -p lightway-core/third_party
    cp -af liboqs wolfssl lightway-core/third_party
}

pkgver() {
    git -C lightway-core describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    cd lightway-core
    ceedling release project:linux
    doxygen
}

check() {
    cd lightway-core
    ceedling test project:linux
}

package_lightway-core-git() {
    provides=('lightway-core')
    conflicts=('lightway-core')
    
    install -D -m644 lightway-core/build/release/*.a -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' lightway-core/public "${pkgdir}/usr/include"
}

package_lightway-core-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('lightway-core-doc')
    conflicts=('lightway-core-doc')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' lightway-core/html "${pkgdir}/usr/share/doc/lightway-core"
}
