# Maintainer: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.19.2
pkgrel=22
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
    024f02852a51c07fa34665ab74b4ed0fccdf8151f0f3e3d3b5e719321341a78e74b30156f0aef9a26889cfff911b184f89d7b567825d9b250e9eb58669493145
    ab1a96d78b61f6f8f1c1762d791cd23001c8e60ad7155a6267da0b47165a1cf5dff5049c539caeca699b2780a201702e0573a0d8284b688bb93f6b1e216ef03c
    552e62acc30c25e2d006ffebc3892d84afabe83c412e450b6e4e33f84b6731ad2dfb6841e6eaf888a15f7aacaef3592160f3e64f4f2c67df5ea10043dc3c72c5
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
