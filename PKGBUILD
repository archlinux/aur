# Maintainer: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.18.0
pkgrel=21
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
    ff8993cdde9997fd43d48707ce48425c36592ca419d75e700d6a6e8cb9ce21c9e30bf26c74b6f21d0d4229d7b4a3ebcda17a8a3330ad3e61cccf27df754670a3
    8f6299c2b07512179c5b6241472095e775fa44bd51cc2b4e69b3506b642ea4f9ebce8b2737cebaa6f8ebbcb8bea2832b610466fe124e9e7b8af844c6495036e3
    34f40427c1bf8beaa866312ed3a259da8e71e35a6dde7810150498ad37324a944bde7c7065a35d9b7fa7ddca483f1413006079f72c34b4b588a25e7ac84b4630
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
    install -Dm644 "${srcdir}"/squashfs-root/usr/share/icons/hicolor/0x0/apps/voicevox.png  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/voicevox.png"
    install -Dm644 "${srcdir}"/squashfs-root/voicevox.desktop "${pkgdir}/usr/share/applications/voicevox.desktop"
}
