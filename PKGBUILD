# Maintainer: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.14.7
pkgrel=15
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
    3d68e0e5e3e645484443b4a4e00dd26295c8a47bf98959e5c65007f76c09e62350110127c74cda93b05edbb423f265f931784102307d43a7b5e2aa8ed034fe2e
    49d055a16e8b77cb3a0b879aaf149efd512349d1a50b7f526bea4a7cf8d4f2dfc5977dd9db060a619c1312a13fe7842798631df04fad6c38b7ead133caa4cd30
    3e3d50ab22fa9be5c39fd456a51a03d0a3d01695ad4ffeae98feea3c91f4de8ac21163b91518c0dabf17fd79798605425414c9f9b6639cf03d3e08f2be2425de
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
    sed -i "s|Exec=.*|Exec=${_installdir}/${_pkgname}|" squashfs-root/voicevox.desktop

    # Unfortunately, since version 0.14.3, voicevox started to package a version of libstdc++ that is incompatible with the system libraries,
    # So we need to rip it out
    ./${_pkgname} --appimage-extract
    rm squashfs-root/libstdc++.so.6   
    unset SOURCE_DATE_EPOCH; appimagetool squashfs-root ${_pkgname}
}

package() {
    install -Dm755 "${srcdir}"/${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm755 "${srcdir}"/voicevox.sh "${pkgdir}/usr/bin/voicevox"
    install -Dm644 "${srcdir}"/squashfs-root/usr/share/icons/hicolor/0x0/apps/voicevox.png  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/voicevox.png"
    install -Dm644 "${srcdir}"/squashfs-root/voicevox.desktop "${pkgdir}/usr/share/applications/voicevox.desktop"
}
