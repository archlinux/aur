# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=datazen-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight, open-source AI database client"
arch=('x86_64')
url="https://github.com/flyxl/datazen"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libgcc'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('datazen')
conflicts=('datazen')
options=('!strip' '!debug')

_relurl="${url}/releases/download/v${pkgver}"
source=(
    "${pkgname}-${pkgver}.deb::${_relurl}/DataZen_${pkgver}_amd64-linux-x64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/flyxl/datazen/v${pkgver}/LICENSE"
)
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=(
    '620ec53e1095400a957802af9990ff16f0f3227728b325644c774ccd2dff777a'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

prepare() {
    rm -rf "${srcdir}/debroot"
    mkdir -p "${srcdir}/debroot"

    # The release .deb is an ar archive whose payload is data.tar.gz.
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz \
        | bsdtar -xf - -C "${srcdir}/debroot"
}

package() {
    cd "${srcdir}/debroot"

    cp -a usr/. "${pkgdir}/usr/"

    # Upstream leaves Categories empty, which hides the app from categorized
    # desktop menus. Keep the vendor entry otherwise unchanged.
    sed -i 's/^Categories=.*/Categories=Development;Database;/' \
        "${pkgdir}/usr/share/applications/DataZen.desktop"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
