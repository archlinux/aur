# Maintainer: Arslan <arslan@example.com>
# Contributor: Freedownloadmanager Team <support@freedownloadmanager.org>

pkgname=freedownloadmanager-bin
pkgver=6.34.4.6974
pkgrel=1
pkgdesc="Free Download Manager (FDM) - powerful modern download accelerator and organizer (binary release)"
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('custom')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'bubblewrap' 'xcb-util-cursor' 'libxkbcommon-x11' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('desktop-file-utils' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}-amd64.deb::https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=('299c5bef180b578ae223e03a108279c3b80ec7f9bce3e1792469d46dee2fc6cd')

prepare() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    # Extract the .deb
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" -C "${srcdir}/${pkgname}-${pkgver}"
    # Extract the data
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}/data.tar.xz" -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Fix .desktop file to point to /usr/bin/fdm
    sed -i 's|/opt/freedownloadmanager/fdm|/usr/bin/fdm|g' usr/share/applications/freedownloadmanager.desktop
    sed -i 's|/opt/freedownloadmanager/icon.png|freedownloadmanager|g' usr/share/applications/freedownloadmanager.desktop
    sed -i '/^Exec=/a StartupWMClass=fdm' usr/share/applications/freedownloadmanager.desktop

    # Install icon
    install -Dm644 opt/freedownloadmanager/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Copy main files
    cp -dpr --no-preserve=ownership opt usr "${pkgdir}"

    # Create symlink for binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/freedownloadmanager/fdm" "${pkgdir}/usr/bin/fdm"
}