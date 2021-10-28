# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=qhotkey-git
pkgname=('qhotkey-qt6-git' 'qhotkey-qt5-git')
pkgver=1.5.0.r0.g6a0cc37
pkgrel=1
pkgdesc='Library for creating global shortcut/hotkey for desktop Qt6 applications (git version)'
arch=('x86_64')
url='https://github.com/Skycoder42/QHotkey/'
license=('BSD')
makedepends=('git' 'cmake' 'libx11' 'qt5-base' 'qt5-x11extras' 'qt6-base')
source=('git+https://github.com/Skycoder42/QHotkey.git')
sha256sums=('SKIP')

pkgver() {
    git -C QHotkey describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local -a _common_opts=(
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build-qt6 -S QHotkey \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt6' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt6' \
        -DQT_DEFAULT_MAJOR_VERSION:STRING='6' \
        "${_common_opts[@]}"
    make -C build-qt6
    
    cmake -B build-qt5 -S QHotkey \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt5' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt5' \
        "${_common_opts[@]}"
    make -C build-qt5
}

package_qhotkey-qt6-git() {
    depends=('libx11' 'qt6-base')
    provides=('qhotkey-qt6')
    conflicts=('qhotkey-qt6')
    
    make -C build-qt6 DESTDIR="$pkgdir" install
    install -D -m644 QHotkey/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
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

package_qhotkey-qt5-git() {
    pkgdesc="$(sed '/Qt6/s/6/5/' <<< "$pkgdesc")"
    depends=('libx11' 'qt5-base' 'qt5-x11extras')
    provides=('qhotkey-qt5')
    conflicts=('qhotkey-qt5')
    
    make -C build-qt5 DESTDIR="$pkgdir" install
    install -D -m644 QHotkey/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
