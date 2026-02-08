# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qatlib-git
pkgver=26.02.0.r1.g52cba23
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
            '39190c94d64d79120cf0b0dbb98b2e3a30acec3ae0f7312cc79369531c534792')

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
