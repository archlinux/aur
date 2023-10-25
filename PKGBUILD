# Maintainer: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.14.8
pkgrel=17
pkgdesc='Offical Frontend for the free VOICEVOX TTS Engine'
arch=('x86_64')
license=('LGPLv3' 'custom')
url='https://voicevox.hiroshiba.jp/'
provides=('voicevox')
conflicts=('voicevox')

_installdir=/opt/appimages
_pkgname=VOICEVOX.AppImage

source=(
    "https://github.com/VOICEVOX/voicevox/releases/download/${pkgver}/VOICEVOX.AppImage.7z.001"
    "https://github.com/VOICEVOX/voicevox/releases/download/${pkgver}/VOICEVOX.AppImage.7z.002"
    "https://github.com/VOICEVOX/voicevox/releases/download/${pkgver}/VOICEVOX.AppImage.7z.003"
    'voicevox.sh'
)
sha512sums=(
    a7a274d0331bc96bd27e0e7cffd3cc40a94424287b76bfbe94f081238681b4da6d1bcdeac3b0d57857de8c7d833a4f35fe7471b1a8f8d5e434d0de75e0009f78
    97b5d4c5e8434ab5a6e23b177740e72d1d0afdc45b5d5f34e37621f7941926d423a646b8599569954131b0c200de98015034b67817d2b752e798d13f0d407eb6
    d9fcb81362d2234c64883a3d4c5bbb3626cb7c96e5c0896e59237bf9ceadec26e2709430c1ab40a846d1bf69a019bd9f180284f38845f3d4fceccca1a8e03db0
    SKIP
)
depends=( # according to the official install script
    'glibc' # for ldconfig
    'libsndfile'
)
makedepends=(
	'p7zip'
	'appimagetool' # Since 0.14.3
)
options=('!strip')

prepare() {
    cd "${srcdir}"
    7z x VOICEVOX.AppImage.7z.001
    chmod a+x ${_pkgname}
    chmod a+x voicevox.sh
    ./${_pkgname} --appimage-extract '*.desktop'
    ./${_pkgname} --appimage-extract 'usr/share/icons/**'

    # Unfortunately, since version 0.14.3, voicevox started to package a version of libstdc++ that is incompatible with the system libraries,
    # So we need to rip it out
    ./${_pkgname} --appimage-extract
    rm squashfs-root/libstdc++.so.6   
    unset SOURCE_DATE_EPOCH; appimagetool squashfs-root ${_pkgname}

    sed -i "s|Exec=.*|Exec=${_installdir}/${_pkgname}|" squashfs-root/voicevox.desktop
}

package() {
    install -Dm755 "${srcdir}"/${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm755 "${srcdir}"/voicevox.sh "${pkgdir}/usr/bin/voicevox"
    install -Dm644 "${srcdir}"/squashfs-root/usr/share/icons/hicolor/0x0/apps/voicevox.png  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/voicevox.png"
    install -Dm644 "${srcdir}"/squashfs-root/voicevox.desktop "${pkgdir}/usr/share/applications/voicevox.desktop"
}
