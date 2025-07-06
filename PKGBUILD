# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=qhotkey
pkgname=('qhotkey-qt6' 'qhotkey-qt5')
pkgver=1.5.0
pkgrel=5
pkgdesc='Library for creating global shortcut/hotkey for desktop Qt6 applications'
arch=('x86_64')
url='https://github.com/Skycoder42/QHotkey/'
license=('BSD-3-Clause')
makedepends=(
    'cmake'
    'libx11'
    'qt5-base'
    'qt5-x11extras'
    'qt6-base')
source=("https://github.com/Skycoder42/QHotkey/archive/${pkgver}/qhotkey-${pkgver}.tar.gz"
        '010-qhotkey-fix-segfault-under-wayland.patch'::'https://github.com/Skycoder42/QHotkey/commit/bb630252684d3556b79ac7a521616692f348fcf7.patch'
        '020-qhotkey-add-compatibility-with-cmake4.patch'::'https://github.com/Skycoder42/QHotkey/commit/8f90bdf90c0f98f639bcff6c49d8da80ad4b31ea.patch'
        '030-qhotkey-add-compatibility-with-qt-no-keywords.patch'::'https://github.com/Skycoder42/QHotkey/commit/6c0e98492c59206139f8490706aadeb8ed033057.patch')
sha256sums=('e8ca5ba77ad04662c18dce8de4b37b373bcb693a7e062fca3d832bf63473b143'
            '40108fa290eb2d9b0b5f73ac6397781202cdcbd1fde64c6fb66a877abce5bbbe'
            '4ed40e982e4f29dd7545a74701a6e8c1f2eba08d30a489b23428476991c14f08'
            '290907f8132a39351c0adc63d8de9723492ddbec11bf6bc52f3c50283f9ca25e')

prepare() {
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/010-qhotkey-fix-segfault-under-wayland.patch"
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/020-qhotkey-add-compatibility-with-cmake4.patch"
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/030-qhotkey-add-compatibility-with-qt-no-keywords.patch"
}

build() {
    local -a _common_opts=(
        '-GUnix Makefiles' \
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build-qt6 -S "QHotkey-${pkgver}" \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt6' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt6' \
        -DQT_DEFAULT_MAJOR_VERSION:STRING='6' \
        "${_common_opts[@]}"
    cmake --build build-qt6
    
    cmake -B build-qt5 -S "QHotkey-${pkgver}" \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt5' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt5' \
        "${_common_opts[@]}"
    cmake --build build-qt5
}

package_qhotkey-qt6() {
    depends=(
        'gcc-libs'
        'glibc'
        'libx11'
        'qt6-base')
    
    DESTDIR="$pkgdir" cmake --install build-qt6
    install -D -m644 "QHotkey-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # create symlinks on the default paths, for the Qt6 library to be the default one
    
    install -d -m755 "${pkgdir}/usr/lib/cmake"
    ln -s ../qhotkey-qt6/cmake/QHotkey "${pkgdir}/usr/lib/cmake/QHotkey"
    
    local _file
    while read -r -d '' _file
    do
        ln -s "qhotkey-qt6/${_file##*/}" "${pkgdir}/usr/include/${_file##*/}"
    done < <(find "${pkgdir}/usr/include/qhotkey-qt6" -mindepth 1 -maxdepth 1 -print0)
    
    while read -r -d '' _file
    do
        ln -s "qhotkey-qt6/${_file##*/}" "${pkgdir}/usr/lib/${_file##*/}"
    done < <(find -L "${pkgdir}/usr/lib/qhotkey-qt6" -mindepth 1 -maxdepth 1 -type f -print0)
}

package_qhotkey-qt5() {
    pkgdesc="$(sed '/Qt6/s/6/5/' <<< "$pkgdesc")"
    depends=(
        'gcc-libs'
        'glibc'
        'libx11'
        'qt5-base'
        'qt5-x11extras')
    
    DESTDIR="$pkgdir" cmake --install build-qt5
    install -D -m644 "QHotkey-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
