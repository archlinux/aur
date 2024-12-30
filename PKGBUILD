# Maintainer: AzureZeng <weedycn at outlook.com>
# Contributor: chenlong <dragonlayoutt at gmail.com>
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=another-redis-desktop-manager

pkgname="${_pkgname}-appimage"
pkgver=1.7.1
pkgrel=1
pkgdesc="A faster, better and more stable redis desktop manager"
arch=('x86_64')
url="https://github.com/qishibo/AnotherRedisDesktopManager"
provides=('another-redis-desktop-manager' 'another-redis-desktop-manager-appimage')
conflicts=('another-redis-desktop-manager')
license=("MIT")
depends=('fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qishibo/AnotherRedisDesktopManager/v${pkgver}/LICENSE"
)

source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/Another-Redis-Desktop-Manager-linux-${pkgver}-x86_64.AppImage"
)

noextract=("${_appimage}")
sha512sums=('3e70ee6355d1e4451927a9ac288154573684b02f82443ef4ed8fd0fd37257fa8d32ff76a4b1fef5273a8bd69f84eb4e604157334d27e8269ef66ef5c78ac4fb2')
sha512sums_x86_64=('7b1e7976681fde7263a462a9dfd827e9d088623a5b4ff95b2142f421683e525345ad7739dc80fe130b637683ec60590484b51b00ccfee00bd2fb12926b608d1c')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract > /dev/null
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -Dm0644 "${srcdir}/squashfs-root/another-redis-desktop-manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/another-redis-desktop-manager.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
