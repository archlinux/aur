# Maintainer: Trần Nam Tuấn <tuantran1632001@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: s3lph <aur-hsdquy@s3lph.me>

_pkgname='headsetcontrol'
pkgname="${_pkgname}-git"
pkgver=4.0.0.r9.g512fd00
pkgrel=1
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux and MacOSX'
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
license=('GPL-3.0-only')
depends=('hidapi')
makedepends=('cmake' 'git')
provides=(
    "${_pkgname}=${pkgver}"
    "lib${_pkgname}.a=${pkgver}"
    "lib${_pkgname}.so=${pkgver}"
)
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(staticlibs)

pkgver() {
    cd "${_pkgname}"
    git describe --long --abbrev=7 --exclude 'continuous*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"

    # Change version to match PKGBUILD
    sed -i 's/COMMAND git describe --tags --dirty=-modified/COMMAND git describe --long --abbrev=7/' CMakeLists.txt
}

build() {
    cd "${_pkgname}"

    export CXXFLAGS+=" -ffat-lto-objects"

    cmake -B build -S . \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DBUILD_SHARED_LIBRARY=ON \
      -DBUILD_UNIT_TESTS=ON \
      -Wno-dev

    cmake --build build
}

check() {
    cd "${_pkgname}"

    cmake --build build --target check
}

package() {
    cd "${_pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm644 license -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
