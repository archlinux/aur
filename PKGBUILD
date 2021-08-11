# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=lightway-core-git
pkgname=('lightway-core-git' 'lightway-core-doc-git')
pkgver=r3.g58e8b98
pkgrel=1
pkgdesc='A VPN protocol by ExpressVPN (git version)'
arch=('x86_64')
url='https://www.expressvpn.com/lightway/'
license=('GPL2')
makedepends=('git' 'ruby-ceedling' 'doxygen')
source=('git+https://github.com/expressvpn/lightway-core.git'
        'git+https://github.com/wolfSSL/wolfssl.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    local _wolfssl_commit
    _wolfssl_commit="$(awk '/he_wolfssl_commit/ { print $3 }' lightway-core/unix.yml)"
    git -C wolfssl config --local advice.detachedHead false
    git -C wolfssl checkout "$_wolfssl_commit"
    
    sed -i 's/\-Werror//' wolfssl/m4/ax_harden_compiler_flags.m4
    
    mkdir -p lightway-core/third_party
    cp -af wolfssl lightway-core/third_party
}

pkgver() {
    printf 'r%s.g%s' "$(git -C lightway-core rev-list --count HEAD)" \
                     "$(git -C lightway-core rev-parse --short HEAD)"
}

build() {
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
    
    install -D -m644 lightway-core/public/*.h -t "${pkgdir}/usr/include"
    install -D -m644 lightway-core/build/release/libhelium.a -t "${pkgdir}/usr/lib"
}

package_lightway-core-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('lightway-core-doc')
    conflicts=('lightway-core-doc')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' lightway-core/html "${pkgdir}/usr/share/doc/lightway-core"
}
