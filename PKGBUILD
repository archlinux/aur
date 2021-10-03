# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=qhotkey
pkgname=('qhotkey-qt6' 'qhotkey-qt5')
pkgver=1.4.2
pkgrel=1
pkgdesc='Library for creating global shortcut/hotkey for desktop Qt6 applications'
arch=('x86_64')
url='https://github.com/Skycoder42/QHotkey/'
license=('BSD')
makedepends=('cmake' 'libx11' 'qt5-base' 'qt5-x11extras' 'qt6-base')
source=("https://github.com/Skycoder42/QHotkey/archive/${pkgver}/qhotkey-${pkgver}.tar.gz"
        '010-qhotkey-add-qt6-support.patch'::'https://github.com/Skycoder42/QHotkey/commit/25f21849b3335f437ec6ee2cc74f043d174aaebb.patch'
        '020-qhotkey-fix-cmake-exported-include-dir.patch'::'https://github.com/Skycoder42/QHotkey/commit/6b3cc35bbd91562ee5192b6b9e9e510a00769c97.patch'
        '030-qhotkey-cmake-private-linking.patch'::'https://github.com/Skycoder42/QHotkey/commit/79e5dd65be78ccd43db69a40a40624a6203b1f51.patch')
sha256sums=('a6d5505a50c52bcc876c8d0bf2bb8a1dcd9f5ea60dacea07d8372137115b7f6d'
            '3762df7dc75cabd644003783eb5d616379b5233da1128efed54746f58df23e26'
            '0a06f2f424a512681f6768a248025b59bb038880aa016b4ce7dd9f951e9ae177'
            '012a837dfe6bf1f91f53597198d75d919a7f07454eae268f1897968a2eee8ebc')

prepare() {
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/010-qhotkey-add-qt6-support.patch"
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/020-qhotkey-fix-cmake-exported-include-dir.patch"
    patch -d "QHotkey-${pkgver}" -Np1 -i "${srcdir}/030-qhotkey-cmake-private-linking.patch"
}

build() {
    local -a _common_opts=(
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build-qt6 -S "QHotkey-${pkgver}" \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt6' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt6' \
        -DQT_MAJOR:STRING='6' \
        "${_common_opts[@]}"
    make -C build-qt6
    
    cmake -B build-qt5 -S "QHotkey-${pkgver}" \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/qhotkey-qt5' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/qhotkey-qt5' \
        "${_common_opts[@]}"
    make -C build-qt5
}

package_qhotkey-qt6() {
    depends=('libx11' 'qt6-base')
    
    make -C build-qt6 DESTDIR="$pkgdir" install
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
    depends=('libx11' 'qt5-base' 'qt5-x11extras')
    
    make -C build-qt5 DESTDIR="$pkgdir" install
    install -D -m644 "QHotkey-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
