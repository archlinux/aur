# Maintainer: Ariejan de Vroom <ariejan.de.vroom@kabisa.nl>
pkgname=slopsmith-desktop-bin
_pkgname=slopsmith-desktop
pkgver=0.2.8
pkgrel=1
pkgdesc="Slopsmith desktop app with integrated audio engine, VST hosting, and amp modeling"
arch=('x86_64')
url="https://github.com/byrongamatos/slopsmith-desktop"
license=('MIT')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
    'alsa-lib'
)
optdepends=(
    'libappindicator-gtk3: tray icon support'
    'jack2: low-latency audio I/O'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('af2cee489e6ed0105eff7ce412eb4d755299c0d218f15bbeb4af920f3783e054')
noextract=("${_pkgname}-${pkgver}.deb")

package() {
    cd "${srcdir}"
    bsdtar -xf "${_pkgname}-${pkgver}.deb"
    bsdtar -xpf data.tar.* -C "${pkgdir}"

    # Remove paths Arch packages should not ship
    rm -rf "${pkgdir}/usr/share/doc"

    # Replace .deb's update-alternatives bin with a plain symlink
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/Slopsmith/slopsmith-desktop" "${pkgdir}/usr/bin/slopsmith-desktop"

    # SUID chrome-sandbox so Electron works on kernels without unprivileged userns
    chmod 4755 "${pkgdir}/opt/Slopsmith/chrome-sandbox"
}
