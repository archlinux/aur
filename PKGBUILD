# Maintainer: taotieren <admin@taotieren.com>

pkgname=libdamiao-motor-control-git 
pkgver=r10.e1e508e
pkgrel=1
epoch=
pkgdesc="Damiao (达妙) Motor Linux-C++ Driver Library"
arch=($CARCH)
url="https://github.com/cmjang/DM_Motor_Control"
license=('Apache-2.0')
groups=()
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    git
    cmake
    ninja
)
checkdepends=()
optdepends=()
provides=(${pkgname%-git} libdamiao)
conflicts=(${pkgname%-git} libdamiao)
replaces=()
backup=()
options=(!debug !strip)
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()
pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd ${srcdir}/${pkgname}
    sed -i '/#include <string>/a#include <array>\n#include <cstdint>' SerialPort.h
}

build() {
    cmake -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja

    ninja -C "${srcdir}/build"
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    # DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
    cd "${srcdir}/${pkgname}/"

    install -vDm0755 ${srcdir}/build/DM_Linux_Drive "${pkgdir}/usr/bin/dm-linux-drive"
    install -vDm0644 damiao.h -t "${pkgdir}/usr/include/libdamiao/"
    install -vDm0644 SerialPort.h -t "${pkgdir}/usr/include/libdamiao/"
    install -vDm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/libdamiao.pc" << EOF
prefix=/usr
exec_prefix=\${prefix}
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: libdamiao
Description: DaMiao motor control library
Version: ${pkgver}
Cflags: -I\${includedir}/libdamiao
Libs: -L\${libdir} -ldamiao
EOF
    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/cmake/libdamiao/libdamiao-config.cmake" << EOF
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBDAMIAO QUIET libdamiao)

if(LIBDAMIAO_FOUND)
    add_library(libdamiao::libdamiao INTERFACE IMPORTED)
    set_target_properties(libdamiao::libdamiao PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "\${LIBDAMIAO_INCLUDE_DIRS}"
    )
    set(libdamiao_FOUND TRUE)
endif()
EOF
    
    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/cmake/libdamiao/libdamiao-config-version.cmake" << EOF
set(PACKAGE_VERSION "${pkgver}")
if(PACKAGE_FIND_VERSION VERSION_EQUAL PACKAGE_VERSION)
    set(PACKAGE_VERSION_EXACT TRUE)
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
elseif(PACKAGE_FIND_VERSION VERSION_LESS PACKAGE_VERSION)
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
else()
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()
EOF
}
