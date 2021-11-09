# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=spacestation14-launcher-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Space Station 14 launcher"
url="https://spacestation14.io/"
license=('MIT')
arch=(x86_64)
options=(!strip staticlibs)
# sources need to have unique filenames
_source_name="SS14.launcher.v${pkgver}.zip"
optdepends=('fluidsynth: needed for in-game midi instruments')
source=(
    "${_source_name}::https://github.com/space-wizards/SS14.Launcher/releases/download/v${pkgver}/SS14.Launcher_Linux.zip"
    "spacestation14.svg::https://spacestation14.io/images/main/icon.svg"
    "SS14.desktop")

sha256sums=('3bb07366fa98881797c5bab61440a3aff4e00fbe41359e4c3d12b5b5945f9e2e'
            'ba123bf55027694ffbf3528f58ba7554d072a023de3282187dd692f365ee9ce5'
            '7645b08e7ca3ac6460ceea8862793c63bc088c04b52b535bce07e5fd4327d4be')

prepare() {
    cd "${srcdir}"
    mkdir -p SS14; cd SS14
    # it's important to run bsdtar outside of fakeroot
    # as it acts differently with ownership data as root
    bsdtar -x -f "${srcdir}/${_source_name}"
}

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/SS14" "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/SS14/SS14.Launcher" "${pkgdir}/usr/bin/spacestation14-launcher"

    mkdir -p "${pkgdir}/usr/share/applications"
    sed "s/<VERSION>/${pkgver}/" "${srcdir}/SS14.desktop" > "${pkgdir}/usr/share/applications/SS14.desktop"

    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${srcdir}/spacestation14.svg" "${pkgdir}/usr/share/pixmaps"
}
