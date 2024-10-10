# Maintainer: Glucy2 <glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-git

pkgver=2.0.46.0.g94f8c5b
pkgrel=1
pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'
license=("${srcdir}/sast-evento/LICENSE")

_slintver=1.8.0

source_x86_64=("https://github.com/slint-ui/slint/releases/download/v${_slintver}/Slint-cpp-${_slintver}-Linux-x86_64.tar.gz")
sha256sums_x86_64=('3999bb654437720972f085946549a0ff865b5971784e3ad575b054b73b746f75')
makedepends=(
    'git'
    'base-devel'
    'cmake'
    'qt5-base'
    'qt6-base'
    'boost'
    'rust'
    'nlohmann-json'
    'spdlog'
    'liburing'
    'libsecret'
    'tomlplusplus'
    'autoconf-archive'
    'libxcb'
    'libxrender'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    )
depends=('boost')
arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

pkgver() {
    cd ${srcdir}/sast-evento
    git --no-pager describe --tags --exclude "v[0-9]*[._][0-9]*[._][0-9]*-[0-9]*" --always --dirty --long | sed 's/-/./g'
}

prepare() {
    rm -rf ${srcdir}/sast-evento
    cd ${srcdir}
    git clone --recursive -b dev https://github.com/NJUPT-SAST/sast-evento.git
}

build() {
    cd ${srcdir}/sast-evento
    cmake -B build \
        -DSLINT_FEATURE_RENDERER_SKIA=ON \
        -DSLINT_FEATURE_RENDERER_FEMTOVG=OFF \
        -DSlint_DIR=${srcdir}/Slint-cpp-1.8.0-Linux-x86_64/lib/cmake/Slint
    cmake --build build
    cmake --install ./build --prefix ${srcdir}/installed
}

package() {
    cp -r ${srcdir}/installed/* ${pkgdir}
}
