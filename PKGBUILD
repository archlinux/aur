# Maintainer: taotieren <admin@taotieren.com>

pkgname=qschematic
pkgver=3.0.3
pkgrel=1
epoch=
pkgdesc="A library that allows creating diagrams such as flowcharts or even proper engineering schematics within a Qt application"
arch=($CARCH)
url="https://github.com/simulton/QSchematic"
license=('MIT')
_qt=qt6
groups=()
depends=(
    glibc
    libgcc
    libstdc++
    $_qt-base
    # AUR
    gpds
)
makedepends=(
    cmake
    ninja
    git
    $_qt-tools
    pkgconf
    vulkan-headers 
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
sha256sums=('dae99032872ebdf69adf67485303c3b521fc9f4d4a743d2a00e059d698df3fa3')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D QSCHEMATIC_BUILD_STATIC=OFF \
        -D QSCHEMATIC_BUILD_DEMO=OFF \
        -D QSCHEMATIC_DEPENDENCY_GPDS_TARGET:STRING="gpds::gpds-shared" \
        -D QSCHEMATIC_DEPENDENCY_GPDS_DOWNLOAD=OFF \
        -D QSCHEMATIC_BUILD_SHARED=ON \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/qschematic.pc" << EOF
prefix=/usr
exec_prefix=\${prefix}
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: qschematic
Description: ${pkgdesc}
Version: ${pkgver}
Requires: ${_qt_modules} gpds
Cflags: -I\${includedir} -I\${includedir}/qschematic
Libs: -L\${libdir} -lqschematic
Libs.private: -lQt6Core -lQt6Gui -lQt6Widgets -lQt6Svg
EOF
}
