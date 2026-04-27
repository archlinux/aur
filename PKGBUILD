# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qatlib-git
pkgver=26.02.0.r10.g1176355
pkgrel=1
pkgdesc='User space library for Intel(R) QuickAssist Technology (git version)'
url='https://github.com/intel/qatlib/'
license=('BSD-3-Clause')
arch=('x86_64')
depends=(
    'bash'
    'glibc'
    'libcrypto.so'
    'numactl')
makedepends=(
    'autoconf-archive'
    'git'
    'nasm')
provides=('qatlib')
conflicts=('qatlib')
source=('git+https://github.com/intel/qatlib.git'
        'qatlib.sysusers')
sha256sums=('SKIP'
            '20376c3ace6ca8e15c0ee0b2104049a8c2ff69113d51e489d121d41e2c0edcee')

prepare() {
    cd qatlib
    ./autogen.sh
}

pkgver() {
    git -C qatlib describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    cd qatlib
    ./configure --prefix='/usr'
    make
}

package() {
    make \
        -C qatlib \
        prefix="${pkgdir}/usr" \
        sbindir="${pkgdir}/usr/bin" \
        systemdsystemunitdir="${pkgdir}/usr/lib/systemd/system" \
        systemd_scriptsdir="${pkgdir}/usr/bin" \
        install
    install -D -m644 qatlib.sysusers "${pkgdir}/usr/lib/sysusers.d/qatlib.conf"
    install -D -m644 qatlib/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
