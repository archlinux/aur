# Maintainer: Ch3w3y <ch3w3y@github.com>
# Contributor: Joe Paji <joepaji@github.com>
pkgname=tuxbellum
pkgver=3.0.4
pkgrel=1
pkgdesc="GTK4 GUI for installing Bellum on Linux via Wine/Proton"
arch=('x86_64')
url="https://github.com/Ch3w3y/tuxbellum"
license=('Apache-2.0')
depends=(
    'python>=3.11'
    'gtk4'
    'python-gobject'
    'wine'
    'winetricks'
    'wget'
    'umu-launcher'
)
optdepends=(
    'gamescope: gamescope integration mode'
    'gamemode: Feral gamemode performance'
    'mangohud: performance overlay'
    'mesa-utils: GPU detection via glxinfo'
)
makedepends=(
    'meson'
    'meson-python'
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ch3w3y/tuxbellum/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b7668b147958f9edcb847dcc3cf05503ecf1e72941e2b47380d849f73a24f3f2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 data/tuxbellum.desktop \
        "${pkgdir}/usr/share/applications/tuxbellum.desktop"
    install -Dm644 data/tuxbellum.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/tuxbellum.metainfo.xml"
    install -Dm644 data/icons/bellum.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bellum.png"
    # Install bundled packages (exclude press kit)
    cp -r packages "${pkgdir}/usr/share/tuxbellum/"
    rm -rf "${pkgdir}/usr/share/tuxbellum/packages/Public Press Kit"
    # Install locales
    cp -r locales "${pkgdir}/usr/share/tuxbellum/"
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# To generate .SRCINFO for AUR submission:
#   makepkg --printsrcinfo > .SRCINFO