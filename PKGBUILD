# Maintainer: taotieren <admin@taotieren.com>

pkgbase=pdcom
pkgname=(pdcom python-pdcom)
pkgver=5.3.1
pkgrel=1
pkgdesc="The Data Logging Service (DLS) is a data logging system for EtherLab, that is capable of collecting, compressing and storing high-frequency realtime data. The goal is, to allow the user unlimited and performant access to the stored data."
arch=($CARCH)
url="https://gitlab.com/etherlab.org/pdcom"
license=('GPL-3.0-or-later')
replaces=()
depends=(
    expat
    gcc-libs
    glibc
    gnutls
    libsasl
    python
)
makedepends=(
    git
    cmake
    ninja
    #     doxygen
    systemd-libs
    pkgconf
    pybind11
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(
    ctest)
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz")

sha256sums=('064c77a6743a550501ad8336e4ae06abb7a2ced8fd10b6c8e81ef84c5b320424')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
    cd python
    python -m build --wheel --no-isolation
}

package_pdcom() {
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        expat
        gcc-libs
        glibc
        gnutls
        libsasl
    )

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase}-${pkgver}/build install
}

package_python-pdcom() {
    pkgdesc+=" -- python"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        pdcom

        glibc
        gcc-libs
        python
        python-numpy
    )

    cd "${srcdir}"/${pkgbase}-${pkgver}/python
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
