# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core
pkgname=('lightway-core' 'lightway-core-doc')
pkgver=1.17.7
pkgrel=1
_ruby_ver=3.1.6
_ceedling_ver=0.31.1
pkgdesc='A VPN protocol by ExpressVPN'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL-2.0-or-later')
makedepends=('git' 'cmake' 'doxygen' 'graphviz')
source=("https://github.com/expressvpn/lightway-core/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
        'git+https://github.com/wolfSSL/wolfssl.git'
        "https://cache.ruby-lang.org/pub/ruby/${_ruby_ver%.*}/ruby-${_ruby_ver}.tar.xz"
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('a385d810191176f4a5ff2fe6f92e74a1d1b0a03571a567bf9b087695f809e101'
            'SKIP'
            '597bd1849f252d8a6863cb5d38014ac54152b508c36dca156f6356a9e63c6102'
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
    local _ruby_root="${srcdir}/ruby/${_ruby_ver}"
    export GEM_HOME="$_ruby_root"
    export GEM_PATH="$_ruby_root"
    export PATH="${_ruby_root}/bin${PATH:+":${PATH}"}"
    cd "ruby-${_ruby_ver}"
    ./configure --prefix="$_ruby_root" --enable-shared
    make install
    gem install --no-user-install --install-dir "$_ruby_root" ceedling -v "$_ceedling_ver"
    
    export CFLAGS+=' -ffat-lto-objects'
    [ -z "$LC_ALL" ] && export LC_ALL='C'
    cd "../${pkgbase}-${pkgver}"
    ceedling release project:linux
    doxygen
}

check() {
    local _ruby_root="${srcdir}/ruby/${_ruby_ver}"
    export GEM_HOME="$_ruby_root"
    export GEM_PATH="$_ruby_root"
    export PATH="${_ruby_root}/bin${PATH:+":${PATH}"}"
    
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
