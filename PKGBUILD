# Maintainer: envolution
pkgname=artisan-roaster-scope
_appname='artisan'
pkgver=3.0.2
pkgrel=2
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("x86_64")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=()

source=(
	"https://github.com/artisan-roaster-scope/artisan/releases/download/v${pkgver}/artisan-linux-${pkgver}.AppImage"
)

sha256sums=('a2168bddf64c97708e35fffcea2222810cdd6841934a84a9644a423d0f970387')

options+=(!strip !debug) 

prepare() {
    _pkgfilename="${pkgname%%-*}-linux-${pkgver}.AppImage"
    chmod +x "${_pkgfilename}"
    ./"${_pkgfilename}" --appimage-extract
	mv ${_pkgfilename} "${_appname}.AppImage"
	cd squashfs-root
	mv org.artisan_scope.artisan.desktop ${_appname}.desktop
	mv AppRun $_appname
}

build() {
	sed -i -E "s|^Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_appname} %U|"\
    "squashfs-root/${_appname}.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appname}.AppImage" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"
    #install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop"\
            "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${_appname}"

}

# vim: ts=2 sw=2 et:
