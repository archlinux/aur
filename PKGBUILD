# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Daniel Henry <d at hackr dot pl>
# Contributor: Miguel Revilla <yo at  miguelrevilla dot com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=megasync
pkgver=5.4.1.0
pkgrel=1
pkgdesc='Official MEGA desktop application for syncing with MEGA Cloud Drive'
arch=('x86_64')
url='https://github.com/meganz/MEGAsync/'
license=('LicenseRef-Mega-Limited-Code-License')
depends=('c-ares'
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
         'zlib'
)
makedepends=('git' 'cmake' 'qt5-tools')
source=("git+https://github.com/meganz/MEGAsync.git#tag=v${pkgver}_Linux"
        'meganz-sdk'::'git+https://github.com/meganz/sdk.git'
        '010-megasync-freeimage-remove-obsolete-ffmpeg-macros.patch'
        '020-megasync-sdk-fix-cmake-dependencies-detection.patch'
        '030-megasync-app-fix-cmake-dependencies-detection.patch'
        '040-megasync-restore-version.patch')
sha256sums=('8bd224547574f9da02d1db3532ca63e95253b80499c323e01fe8d6f7f76cdc1b'
            'SKIP'
            '3df5d43ca1951c9e48dbb7f8e221bc8fff1a9fb1b7c934cb5ea7f195ae8f2e04'
            '2da83bb6a20aa19b58b4115646bacb9d76e2504b45b5094abeba94beac2301fb'
            'a5883be2d00dbacaacf78231bfeeac27f4e8a471c3256370e94fec3e55b1d171'
            '1fc357c73283aac125d8ca391033d800993dff196bd23f59890e92d5415ae22f')

prepare() {
    # at the time of writting, there are no versions 7.7.0-rc.3, 7.7.0-rc2 and 7.7.0
    # in the public sdk repository, which are referenced by the commits bellow
    git -C MEGAsync revert --no-edit --no-commit 243d77ebb7239d7ff5cd8b7aea6c0158d1c6c813
    git -C MEGAsync revert --no-edit --no-commit 21514f4407764f7760d6dbc60fab98b46108b888
    git -C MEGAsync revert --no-edit --no-commit 8241bfea13cfcdc5362db148ce8ac2b05db46c9d
    
    git -C MEGAsync submodule init
    git -C MEGAsync config --local submodule.src/MEGASync/mega.url "${srcdir}/meganz-sdk"
    git -C MEGAsync -c protocol.file.allow='always' submodule update
    
    patch -d MEGAsync/src/MEGASync/mega -Np1 -i "${srcdir}/010-megasync-freeimage-remove-obsolete-ffmpeg-macros.patch"
    patch -d MEGAsync/src/MEGASync/mega -Np1 -i "${srcdir}/020-megasync-sdk-fix-cmake-dependencies-detection.patch"
    patch -d MEGAsync -Np1 -i "${srcdir}/030-megasync-app-fix-cmake-dependencies-detection.patch"
    
    # restore the 5.4.1.0 version (reverted by the git revert commands above)
    patch -d MEGAsync -Np1 -i "${srcdir}/040-megasync-restore-version.patch"
}

build() {
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S MEGAsync \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_MODULE_PATH:PATH="${srcdir}/MEGAsync/src/MEGASync/mega/contrib/cmake/modules/packages" \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
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
