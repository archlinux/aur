# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core
pkgname=('lightway-core' 'lightway-core-doc')
pkgver=1.17.5
pkgrel=1
_ruby_ver=3.1.6
_ceedling_ver=0.31.1
pkgdesc='A VPN protocol by ExpressVPN'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL-2.0-or-later')
makedepends=('git' 'cmake' 'doxygen' 'graphviz'
             'rbenv' 'rust' 'libffi' 'libyaml' 'openssl' 'zlib')
source=("https://github.com/expressvpn/lightway-core/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
        'git+https://github.com/wolfSSL/wolfssl.git'
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('8ad6124a6e31c98662dab95a9d3977792d259e9fb73c1b0a9c50aa809824322e'
            'SKIP'
            'fd82affc9e605a7963e5b4908d8decc877980ac007f9ba5aabeccf9019cf5727')

prepare() {
    local _wolfssl_tag
    _wolfssl_tag="$(awk '/HE_WOLFSSL_TAG/ { print $3 }' "${pkgbase}-${pkgver}/3rd_party_deps.yml")"
    git -C wolfssl config --local advice.detachedHead false
    git -C wolfssl checkout --quiet "$_wolfssl_tag"
    
    patch -d wolfssl -Np1 -i "${srcdir}/010-lightway-core-disable-werror-on-wolfssl.patch"
    
    mkdir -p "${pkgbase}-${pkgver}/third_party"
    cp -af wolfssl "${pkgbase}-${pkgver}/third_party"
}

build() {
    export GEM_HOME="${srcdir}/ruby/versions/${_ruby_ver}"
    export GEM_PATH="$GEM_HOME"
    export PATH="${GEM_HOME}/bin:${PATH}"
    export RBENV_ROOT="${srcdir}/ruby"
    rbenv install --force "$_ruby_ver"
    gem install --no-user-install --install-dir "${srcdir}/ruby/versions/${_ruby_ver}" ceedling -v "$_ceedling_ver"
    
    export CFLAGS+=' -ffat-lto-objects'
    [ -z "$LC_ALL" ] && export LC_ALL='C'
    cd "${pkgbase}-${pkgver}"
    ceedling release project:linux
    doxygen
}

check() {
    export GEM_HOME="${srcdir}/ruby/versions/${_ruby_ver}"
    export GEM_PATH="$GEM_HOME"
    export PATH="${GEM_HOME}/bin:${PATH}"
    
    cd "${pkgbase}-${pkgver}"
    ceedling test project:linux
}

package_lightway-core() {
    install -D -m644 "${pkgbase}-${pkgver}/build/release"/*.a -t "${pkgdir}/usr/lib"
    install -d -m755 "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' "${pkgbase}-${pkgver}/public" "${pkgdir}/usr/include/libhelium"
}

package_lightway-core-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' "${pkgbase}-${pkgver}/html" "${pkgdir}/usr/share/doc/${pkgbase}"
}
