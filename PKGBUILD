# Maintainer: taotieren <admin@taotieren.com>

pkgname=pdserv
pkgver=3.4.0
pkgrel=1
pkgdesc="The PdServ library provides process data communication mechanisms for Linux real-time applications in user space (i. e. using RT-PREEMPT). The main focus is placed on providing a process-data interface without interfering real-time operation."
arch=($CARCH)
url="https://gitlab.com/etherlab.org/pdserv"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
    gnutls
    libsasl
    libyaml
    log4cplus
    db
)
makedepends=(
    git
    cmake
    ninja
    #     doxygen
    pkgconf
)
checkdepends=()
optdepends=(
    'pam: PAM (Pluggable Authentication Modules) library'
    'pdcom: The Data Logging Service (DLS) is a data logging system for EtherLab, that is capable of collecting, compressing and storing high-frequency realtime data. The goal is, to allow the user unlimited and performant access to the stored data.')
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('99bcf63e90abd06628afe59ae5cdc6dfa8f9a5e60ad9c1482128a0d250992dfb')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPAM_SERVICE_DIR=/etc/security \
	 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
