# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt-bin
_pkgname=PDF4QT
_appname=Pdf4qt
_runname=Pdf4Qt
pkgver=1.6.0.0
pkgrel=1
pkgdesc="Open source PDF editor(Prebuilt version)"
arch=('x86_64')
url="https://jakubmelka.github.io/"
_ghurl="https://github.com/JakubMelka/PDF4QT"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    'openssl'
    'libjpeg-turbo'
    'qt6-speech'
    'qt6-svg'
    'qt6-base'
    'openjpeg2'
    'onetbb'
    'lcms2'
    'blend2d'
)
makedepends=(
    'fuse'
)
optdepends=(
	'flite: Text-To-Speech using flite synthesizer',
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
source=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage")
sha256sums=('a9d170d540137701c34e6ea38db7eecd4e033de0e099d4cb93fa1747432294f2')
prepare() {
	if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr"
	install -Dm755 -d "${pkgdir}/usr/bin"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}LaunchPad" "${pkgdir}/usr/bin/${_runname}LaunchPad"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Diff" "${pkgdir}/usr/bin/${_runname}Diff"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Editor" "${pkgdir}/usr/bin/${_runname}Editor"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}PageMaster" "${pkgdir}/usr/bin/${_runname}PageMaster"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Viewer" "${pkgdir}/usr/bin/${_runname}Viewer"
}
