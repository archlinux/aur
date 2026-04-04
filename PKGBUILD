# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-candle-api
_name=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
pkgdesc="Full featured CAN driver for Geschwister Schneider API for USB/CAN devices"
provides=(${pkgname})
conflicts=(${pkgname})
arch=($CARCH)
url="https://github.com/BIRLab/candle_api"
depends=(
    glibc
    libgcc
    libstdc++
    systemd-libs
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    # AUR
    python-cmake
)
license=('MIT')
options=('!strip' '!debug')
source=(
    "${_name}::git+${url}.git#tag=v$pkgver"
    "libusb-cmake::git+https://github.com/libusb/libusb-cmake.git"
    "pybind11::git+https://github.com/pybind/pybind11.git"
)
sha256sums=('856aa1103facd7c1b6fdd750990a9b9b6d1adab296f740fa312b1c4aabea2e0f'
            'SKIP'
            'SKIP')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    git submodule update --init
    git config submodule.candle_api/libusb-cmake.url "$srcdir/libusb-cmake"
    git config submodule.candle_api_pybind11/pybind11.url "$srcdir/pybind11"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
