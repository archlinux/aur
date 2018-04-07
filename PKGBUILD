# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=opendesktop-app-appimage
pkgver=3.1.0
pkgrel=1
pkgdesc="This is the App for Opendesktop with content management features."
arch=('x86_64')
url="https://www.opendesktop.org/p/1175480/"
license=('GPL-3.0')
conflicts=()
provides=('opendesktop')
depends=('libnotify' 'libxss' 'libxtst' 'gconf' 'libindicator' 'libappindicator')
noextract=('OpenDesktop.AppImage')
options=('!strip' '!emptydirs')

source_x86_64=(
    "OpendesktopApp.AppImage::https://dl.opendesktop.org/api/files/downloadfile/id/1522023543/s/f059fc34de2cdeaea00226f310aafb00/t/1523122661/u/71764/opendesktop-app-${pkgver}-1-x86_64.AppImage"
)

md5sums_x86_64=(
    '4b9e8ac74cf6f321b23040cf70272c56'
)

prepare() {
    # mark as executable so we can extract
    chmod +x "${srcdir}/OpendesktopApp.AppImage"

    # extract the AppImage
    "${srcdir}/OpendesktopApp.AppImage" --appimage-extract

    # remove execution bit after extraction
    chmod -x "${srcdir}/OpendesktopApp.AppImage"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/usr"
    cp -Rr "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr"
    rm -f "${pkgdir}/usr/bin/opendesktop-app-appimage"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr" -type f -exec chmod 644 {} \;

    # make sure the main binaries have the right permissions
    chmod +x "${pkgdir}/usr/bin/opendesktop-app"
    chmod +x "${pkgdir}/usr/lib/opendesktop-app-linux-x64/opendesktop-app"
    chmod +x "${pkgdir}/usr/lib/opendesktop-app-linux-x64/resources/app/bin/ocs-manager"
}
