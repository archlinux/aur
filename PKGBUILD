# Maintainer: taotieren <admin@taotieren.com>

pkgname=gpds
pkgver=1.10.0
pkgrel=5
epoch=
pkgdesc="A general purpose data serializer"
arch=($CARCH)
url="https://github.com/simulton/gpds"
license=('LicenseRef-SimultonGmbH')
groups=()
depends=(
    glibc
    libgcc
    libstdc++
    tinyxml2
    yaml-cpp
)
makedepends=(
    cmake
    ninja
    git
    pkgconf
)
optdepends=(

)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('932d2696a4a1bb9218c8791f4e9fc82320b9e13f3df5ff8f7e1d797b7c45cfce')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D OPTION_BUILD_SHARED_DEFAULT=ON \
        -D GPDS_BUILD_STATIC=OFF \
        -D GPDS_DEPENDENCY_TINYXML2_PKGCONFIG=ON \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/gpds.pc" << EOF
prefix=/usr
exec_prefix=\${prefix}
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: gpds
Description: General Purpose Data Serializer
Version: ${pkgver}
Requires: tinyxml2 yaml-cpp
Cflags: -I\${includedir}
Libs: -L\${libdir} -lgpds
EOF
}
