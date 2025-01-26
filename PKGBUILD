# Maintainer: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.22.4
pkgrel=24
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
    1a40f29106382f4eb3da0025a48c450f573aa4260c6550d282e78492672e6fc7c5b8b7774a27c1b10e7626d90c1bb70128237cff36bc388837bcd2bb1c6a6713
    855e0fdf412289c0611cfa29a03ffd92ffa9242a34ea19a6912602b3ef60513f1c7578c81e646ed4c081eba448964e8b6b146776283dc3cef1bf71a1c53b26a0
    92d6f761b85d42b257df7aaa14b743bc2fe9549791b3cb542897f3e3be8fcba8f926fca077ba875e8d330f4167efd9bc5fa0386630763f859250d8d0b08c9918
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
options=('!strip' '!debug')

prepare() {
    cd "${srcdir}"
    7z x VOICEVOX.AppImage.7z.001
    chmod a+x ${_pkgname}
    chmod a+x voicevox.sh
    ./${_pkgname} --appimage-extract '*.desktop'
    ./${_pkgname} --appimage-extract 'usr/share/icons/**'

    # Unfortunately, since version 0.14.3, voicevox started to package a version of libstdc++ that is incompatible with the system libraries,
    # So we need to rip it out
    # XXX: as of 0.17.2, this is no longer an issue
    # ./${_pkgname} --appimage-extract
    # rm squashfs-root/libstdc++.so.6   
    # unset SOURCE_DATE_EPOCH; appimagetool squashfs-root ${_pkgname}

    sed -i "s|Exec=.*|Exec=${_installdir}/${_pkgname}|" squashfs-root/voicevox.desktop
}

package() {
    install -Dm755 "${srcdir}"/${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm755 "${srcdir}"/voicevox.sh "${pkgdir}/usr/bin/voicevox"
    install -Dm644 "${srcdir}"/squashfs-root/usr/share/icons/hicolor/256x256/apps/voicevox.png  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/voicevox.png"
    install -Dm644 "${srcdir}"/squashfs-root/voicevox.desktop "${pkgdir}/usr/share/applications/voicevox.desktop"
}
