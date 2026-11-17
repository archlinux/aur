# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=datazen-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight, open-source AI database client"
arch=('x86_64')
url="https://github.com/flyxl/datazen"
license=('GPL-3.0-or-later')
# The database encryption key lives in the Secret Service keyring; without one
# (and no legacy .key file) DataZen refuses to start unless DATAZEN_KEYRING=file.
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
    'org.freedesktop.secrets'
    'webkit2gtk-4.1'
)
provides=('datazen')
conflicts=('datazen')
options=('!strip' '!debug')

_relurl="${url}/releases/download/v${pkgver}"
source=(
    "${pkgname}-${pkgver}.deb::${_relurl}/DataZen-${pkgver}-linux-x64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/flyxl/datazen/v${pkgver}/LICENSE"
)
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('dc4d39a7e69d591aefea3f0697aa8c1df1f9759e3db952e9620aa473a26b8e5e'
            'd8369d4fd80887d45cd647bb67f2fbf4c500c516745b96444fc07d814fe48209')

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

    # 0.3.0 renamed the binary to datazen_desktop; keep the old command.
    ln -s datazen_desktop "${pkgdir}/usr/bin/datazen"

    # Upstream leaves Categories empty, which hides the app from categorized
    # desktop menus. Keep the vendor entry otherwise unchanged.
    sed -i 's/^Categories=.*/Categories=Development;Database;/' \
        "${pkgdir}/usr/share/applications/DataZen.desktop"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
