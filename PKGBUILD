# Maintainer: Jat <chat@jat.email>

_pkgname='obs-multi-rtmp'
pkgname="${_pkgname}-git"
pkgver=r362.4fd6d92
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin for OBS Studio. Git version.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
makedepends=('git' 'cmake' 'ninja' 'qt6-base' 'qt6-svg')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    # .github/scripts/.build.zsh

    # cmake_args
    cmake --compile-no-warning-as-error --preset linux-x86_64 -G Ninja -DQT_VERSION=6 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr

    # cmake_build_args
    cmake --build --preset linux-x86_64 --config RelWithDebInfo --parallel

    # cmake_install_args
    cmake --install build_x86_64 --prefix release/RelWithDebInfo
}

package() {
    cd "${pkgdir}"

    mkdir -p usr/lib/obs-plugins
    mkdir -p usr/share/obs/obs-plugins/obs-multi-rtmp

    prefix="${srcdir}/${_pkgname}/release/RelWithDebInfo/dist/obs-multi-rtmp"
    cp -a "${prefix}/bin/64bit/"* usr/lib/obs-plugins
    cp -a "${prefix}/data/"* usr/share/obs/obs-plugins/obs-multi-rtmp
}
