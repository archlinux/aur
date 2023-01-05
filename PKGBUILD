# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-nosystemd
_pkgver=1.0.2
pkgver=${_pkgver//-/.}
pkgrel=0
pkgdesc="Ananicy rewritten in C++ for much lower CPU and memory usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=("https://gitlab.com/ananicy-cpp/${_pkgname}/-/archive/v${_pkgver}/${_pkgname}-v${_pkgver}.tar.gz")
sha256sums=('a809fe61e7c6b1322ebc52278ad33ea4a653721c2a42fe566fdec8f00e0bec85'
            'a9a98ba8ff2b3f7e12f2ac75361018a9ba42f9298aa7e8f6bad3613a03591bc0')
declare -g -A externals
externals['std-format']="dfa4fdc87c7cb9bb1683125009baa7278bb85901"

for external in "${!externals[@]}"; do
    source+=(https://gitlab.com/ananicy-cpp/stl-polyfills/${external}/-/archive/${externals[$external]}/${external}-${externals[$external]}.tar.gz)
done
arch=(x86_64 i386 aarch64 armv7h)
depends=(fmt spdlog nlohmann-json)
makedepends=(cmake git)
optdepends=("ananicy-rules-git: community rules")
conflicts=(ananicy-cpp)

prepare() {
    cd "${_pkgname}-v${_pkgver}"

    echo Externals: "${!externals[@]}"
    for external in "${!externals[@]}"; do
      [ -d "external/${external}" ] && rm -rf "external/${external}"/*
      mv -v "../${external}-${externals[$external]}/"* external/${external}/
    done

    cmake -B "build" . \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DUSE_EXTERNAL_SPDLOG=ON \
            -DUSE_EXTERNAL_JSON=ON \
            -DUSE_EXTERNAL_FMTLIB=ON \
            -DENABLE_SYSTEMD=OFF \
            -DVERSION=${_pkgver}
}

build() {
    cd "${_pkgname}-v${_pkgver}"

    cmake --build build
}

package() {
    cd "${_pkgname}-v${_pkgver}"

    export DESTDIR="$pkgdir"
    cmake --install build --component Runtime

    install -m755 -d "$pkgdir/etc/ananicy.d"
}
