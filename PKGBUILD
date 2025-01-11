# Maintainer: taotieren <admin@taotieren.com>

pkgbase=pdcom
pkgname=(pdcom)
pkgver=5.3.2
pkgrel=3
pkgdesc="The Data Logging Service (DLS) is a data logging system for EtherLab, that is capable of collecting, compressing and storing high-frequency realtime data. The goal is, to allow the user unlimited and performant access to the stored data."
arch=($CARCH)
url="https://gitlab.com/etherlab.org/pdcom"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
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

sha256sums=('de7b2b4394454cab40cc3665c1614d84fc81da25b7871c77e2accb7ecfd56db1')

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

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase}-${pkgver}/build install

    cd "${srcdir}"/${pkgbase}-${pkgver}/python
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
