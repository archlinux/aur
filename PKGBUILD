# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=geos-git
pkgver=3.16.0dev.06da4f3a7
pkgrel=1

pkgdesc="C++ port of the Java Topology Suite (git version)"
url="http://trac.osgeo.org/geos/"
license=("LGPL-2.1-only")

arch=("i686" "x86_64")
makedepends=("cmake" "git")
conflicts=("geos")
provides=("geos")

source=("${pkgname}::git+https://gitea.osgeo.org/geos/geos.git")
b2sums=(
    "SKIP"
)

pkgver() {
    cd "${pkgname}"
    if [[ -e "Version.txt" ]]; then
        source Version.txt
        COMMIT="$(git rev-parse --short HEAD)"
        echo "${GEOS_VERSION_MAJOR}.${GEOS_VERSION_MINOR}.${GEOS_VERSION_PATCH}${GEOS_PATCH_WORD}.${COMMIT}"
    else
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    fi
}

build() {
    cmake \
        -B build \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
    make -C build
}

package() {
    cd "build"
    make DESTDIR="${pkgdir}" install
}
