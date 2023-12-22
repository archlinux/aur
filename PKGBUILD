# Maintainer: taotieren <admin@taotieren.com>

pkgname=yfel-git
pkgver=r327.f643e1e
pkgrel=1
pkgdesc="Yet another Allwinner FEL Toolkit"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/YuzukiTsuru/YFEL"
license=('GPL3')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(libusb
    qt6-tools
    xfel)
makedepends=(
    cmake
    git
    gcc
    ninja)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    echo "
install(TARGETS YFEL
        RUNTIME DESTINATION \${CMAKE_INSTALL_PREFIX}/bin
        LIBRARY DESTINATION \${CMAKE_INSTALL_PREFIX}/lib
        ARCHIVE DESTINATION \${CMAKE_INSTALL_PREFIX}/lib)

install(FILES \${PROJECT_BINARY_DIR}/yfel_config.h
        DESTINATION \${CMAKE_INSTALL_PREFIX}/include)

install(FILES \${qm_files}
        DESTINATION \${CMAKE_INSTALL_PREFIX}/share/locale)

install(FILES \${PROJECT_SOURCE_DIR}/assets/applications/io.github.yuzukitsuru.yfel.desktop
        DESTINATION \${CMAKE_INSTALL_PREFIX}/share/applications)

install(FILES \${PROJECT_SOURCE_DIR}/assets/img/yfel.png
        DESTINATION \${CMAKE_INSTALL_PREFIX}/share/pixmaps)
" >> src/CMakeLists.txt
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S src \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja

    ninja -C build
}

package() {

    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/${pkgname}/build" install
    mv "${pkgdir}/usr/bin/YFEL" "${pkgdir}/usr/bin/yfel"
}
