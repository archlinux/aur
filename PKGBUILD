# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=qatlib
pkgver=26.02.0
pkgrel=2
pkgdesc='User space library for Intel(R) QuickAssist Technology'
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
    'nasm')
source=("https://github.com/intel/qatlib/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'qatlib.sysusers')
sha256sums=('7c68bf05f196153b1b1669a7d17e5bfba6253e7cafb69f67d30a0d17e7facecb'
            '20376c3ace6ca8e15c0ee0b2104049a8c2ff69113d51e489d121d41e2c0edcee')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    cd "${pkgname}-${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    make \
        -C "${pkgname}-${pkgver}" \
        prefix="${pkgdir}/usr" \
        sbindir="${pkgdir}/usr/bin" \
        systemdsystemunitdir="${pkgdir}/usr/lib/systemd/system" \
        systemd_scriptsdir="${pkgdir}/usr/bin" \
        install
    install -D -m644 qatlib.sysusers "${pkgdir}/usr/lib/sysusers.d/qatlib.conf"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
