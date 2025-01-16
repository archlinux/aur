# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Daniel Henry <d at hackr dot pl>
# Contributor: Miguel Revilla <yo at  miguelrevilla dot com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=megasync
pkgver=5.7.1.0
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
sha256sums=('5e606c528ea02e4ee9b6a0c1d79bf9366f0396c6400cfa6a7627709e5391ebdb'
            'SKIP'
            'ed191eba0bf731827d546fd93383267429a8e911faf30b98bf022ad1f9ce0bcb'
            'a2d4c9040282f51e81a9d37d9875d4a9febb1ff1f6af452210be581f0eaa63a7'
            'a5883be2d00dbacaacf78231bfeeac27f4e8a471c3256370e94fec3e55b1d171')

prepare() {
    #git -C MEGAsync submodule init
    #git -C MEGAsync config --local submodule.src/MEGASync/mega.url "${srcdir}/meganz-sdk"
    #git -C MEGAsync -c protocol.file.allow='always' submodule update
    
    # https://github.com/meganz/MEGAsync/issues/1010
    # https://github.com/meganz/MEGAsync/blob/v5.7.1.0_OSX/src/MEGASync/control/Version.h#L20-L21
    git -C meganz-sdk config --local advice.detachedHead false
    git -C meganz-sdk checkout d6a5d2078d1e51394dab205a48bff58d2b130d6b
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
