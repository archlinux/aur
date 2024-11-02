# Maintainer: envolution
pkgname=artisan-roaster-scope
appname='artisan'
pkgver=3.0.2
pkgrel=1
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
	mv ${_pkgfilename} "${appname}.AppImage"
	cd squashfs-root
	mv org.artisan_scope.artisan.desktop ${appname}.desktop
	mv AppRun $appname
}

build() {
	sed -i -E "s|^Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appname} %U|"\
    "squashfs-root/${appname}.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${appname}.AppImage" "${pkgdir}/opt/${pkgname}/${appname}.AppImage"
    #install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appname}.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${appname}.AppImage" "${pkgdir}/usr/bin/${appname}"

}
