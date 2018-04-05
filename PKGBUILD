# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-appimage
pkgver=2.0.0.canary.15
pkgrel=14
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper')
provides=('hyper')
depends=('libnotify' 'libxss' 'libxtst' 'gconf' 'libindicator' 'libappindicator')
noextract=('Hyper.AppImage')
install=hyper-appimage.install
options=('!strip')

_pkgver_correct=${pkgver/\.canary/-canary}

source_x86_64=(
    "Hyper.AppImage::https://github.com/zeit/hyper/releases/download/${_pkgver_correct}/hyper-${_pkgver_correct}-x86_64.AppImage"
)

md5sums_x86_64=(
    '53e1b818d3e8f9ff647ab13e1549b55b'
)

source=(
    "Hyper.desktop"
)

md5sums=(
    'd6ffcfefb9246850d775735217c7736f'
)

prepare() {
    # mark as executable so we can extract
    chmod +x "${srcdir}/Hyper.AppImage"

    # extract the AppImage
    "./${srcdir}/Hyper.AppImage" --appimage-extract
}

package() {
    # install the main files.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/squashfs-root/app/." "${pkgdir}/opt/${pkgname}"

    # make sure the main binary has the right permissions
    chmod 0755 "${pkgdir}/opt/${pkgname}/hyper"

    # desktop entry
    install -D "${srcdir}/Hyper.desktop" "${pkgdir}/usr/share/applications/Hyper.desktop"

    # link the binary
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/${pkgname}/hyper" "${pkgdir}/usr/bin/hyper"

    # install the icons
    install -d "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"
}
