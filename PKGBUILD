# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Daniel Henry <d at hackr dot pl>
# Contributor: Miguel Revilla <yo at  miguelrevilla dot com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=megasync
pkgver=5.10.1.0
pkgrel=1
pkgdesc='Official MEGA desktop application for syncing with MEGA Cloud Drive'
arch=('x86_64')
url='https://github.com/meganz/MEGAsync/'
license=('LicenseRef-Mega-Limited-Code-License')
depends=(
    'c-ares'
    'crypto++'
    'curl'
    'ffmpeg'
    'freeimage'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'icu'
    'libmediainfo'
    'libpdfium'
    'libsodium'
    'libuv'
    'libxcb'
    'libzen'
    'openssl'
    'qt5-base'
    'qt5-declarative'
    'qt5-graphicaleffects'
    'qt5-quickcontrols'
    'qt5-quickcontrols2'
    'qt5-svg'
    'qt5-x11extras'
    'sqlite'
    'zlib')
makedepends=(
    'cmake'
    'git'
    'qt5-tools')
source=("git+https://github.com/meganz/MEGAsync.git#tag=v${pkgver}_OSX"
        'meganz-sdk'::'git+https://github.com/meganz/sdk.git'
        '010-megasync-freeimage-remove-obsolete-ffmpeg-macros.patch'
        '020-megasync-sdk-fix-cmake-dependencies-detection.patch'
        '030-megasync-app-fix-cmake-dependencies-detection.patch')
sha256sums=('b18d03e7976c7452373e6c49c2ca1f4010ac88cebafc03a4112e2cb29e15d46d'
            'SKIP'
            'a88c8cd94606427b9ab0bdbbf059e905554616a2b18981e4fb4c1c2cadc73d65'
            '62e79d30acafdc13855851e64c4419d8ee4a0b213089ea352882b49413e549f4'
            'a5883be2d00dbacaacf78231bfeeac27f4e8a471c3256370e94fec3e55b1d171')

prepare() {
    #git -C MEGAsync submodule init
    #git -C MEGAsync config --local submodule.src/MEGASync/mega.url "${srcdir}/meganz-sdk"
    #git -C MEGAsync -c protocol.file.allow='always' submodule update
    
    # https://github.com/meganz/MEGAsync/issues/1010
    # https://github.com/meganz/MEGAsync/blob/v5.10.1.0_OSX/src/MEGASync/control/Version.h#L20-L21
    git -C meganz-sdk config --local advice.detachedHead false
    git -C meganz-sdk checkout b53514e72d569be8993cbe4b2c991da0ded08b78
    rm -r MEGAsync/src/MEGASync/mega
    ln -sf ../../../meganz-sdk MEGAsync/src/MEGASync/mega
    
    patch -d MEGAsync/src/MEGASync/mega -Np1 -i "${srcdir}/010-megasync-freeimage-remove-obsolete-ffmpeg-macros.patch"
    patch -d MEGAsync/src/MEGASync/mega -Np1 -i "${srcdir}/020-megasync-sdk-fix-cmake-dependencies-detection.patch"
    patch -d MEGAsync -Np1 -i "${srcdir}/030-megasync-app-fix-cmake-dependencies-detection.patch"
}

build() {
    export CXXFLAGS+=' -DNDEBUG -isystem/usr/include/pdfium'
    cmake -B build -S MEGAsync \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_MODULE_PATH:PATH="${srcdir}/MEGAsync/src/MEGASync/mega/cmake/modules/packages" \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -DENABLE_DESIGN_TOKENS_IMPORTER:BOOL='OFF' \
        -DENABLE_DESKTOP_APP_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build --target MEGAsync
}

package () {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 MEGAsync/LICENCE.md -t "${pkgdir}/usr/share/licenses/megasync"
    install -D -m644 MEGAsync/installer/terms.txt -t "${pkgdir}/usr/share/licenses/megasync"
    install -D -m644 MEGAsync/src/MEGASync/mega/LICENSE "${pkgdir}/usr/share/licenses/megasync/LICENCE-SDK"
    rm -d "${pkgdir}/opt"{/megasync{/lib,},}
}
