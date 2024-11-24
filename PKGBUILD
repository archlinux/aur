# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.5.9
pkgrel=1
pkgdesc='Turn your computer into an AI computer'
arch=('x86_64')
url='https://jan.ai/'
license=('AGPL-3.0-only')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('jan')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/janhq/jan/releases/download/v${pkgver}/jan-linux-x86_64-${pkgver}.AppImage")

noextract=("${_appimage}")
sha512sums_x86_64=('a2a2aeac1fd725a7aa7c35a6eec63c020efae9de6a4a16fb6dcbc4adcf12dfd349fc68f51d7f818ecf48a7e7f9f6b720094873cef74d601caf8f77a003eb9c0d')
_appname='jan'

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false \
/usr/bin/${_appname}|" "squashfs-root/${_appname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}"\
	    "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" \
	    "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_appname}"
}
