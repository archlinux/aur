# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core
pkgname=('lightway-core' 'lightway-core-doc')
pkgver=1.17.17
pkgrel=1
_ruby_ver=3.1.7
_ceedling_ver=0.31.1
pkgdesc='A VPN protocol by ExpressVPN'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL-2.0-or-later')
makedepends=('cmake' 'doxygen' 'gcc14' 'git' 'graphviz')
source=("https://github.com/expressvpn/lightway-core/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
        'git+https://github.com/wolfSSL/wolfssl.git'
        "https://cache.ruby-lang.org/pub/ruby/${_ruby_ver%.*}/ruby-${_ruby_ver}.tar.xz"
        '010-lightway-core-disable-werror-on-wolfssl.patch')
sha256sums=('56c2643f74a4a0d2e0b6859af1209f6a7d2a6b27659a067ad8160d11ecc26596'
            'SKIP'
            '658acc455b6bda87ac6cc1380e86552b9c1af87055e7a127589c5bf7ed80b035'
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
    # 'gem install' core dumps when built with gcc 15
    CC='gcc-14' \
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
