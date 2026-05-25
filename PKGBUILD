# Maintainer: Ariejan de Vroom <ariejan.de.vroom@kabisa.nl>
pkgname=slopsmith-desktop-testing-bin
_pkgname=slopsmith-desktop
_upstream_ver=0.2.9-alpha.4
pkgver=0.2.9.alpha.4
pkgrel=1
pkgdesc="Slopsmith desktop app (testing channel: tracks latest release including alpha/beta)"
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
conflicts=("${_pkgname}" 'slopsmith-desktop-bin')
options=('!strip' '!debug')
source=("${_pkgname}-${_upstream_ver}.deb::${url}/releases/download/v${_upstream_ver}/${_pkgname}_${_upstream_ver}_amd64.deb")
sha256sums=('2b2a84bc793d7d92612af7880c63a32070ee3df07fc7d31a6571a4b1fc24c40b')
noextract=("${_pkgname}-${_upstream_ver}.deb")

package() {
    cd "${srcdir}"
    bsdtar -xf "${_pkgname}-${_upstream_ver}.deb"
    bsdtar -xpf data.tar.* -C "${pkgdir}"

    # Remove paths Arch packages should not ship
    rm -rf "${pkgdir}/usr/share/doc"

    # Replace .deb's update-alternatives bin with a plain symlink
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/Slopsmith/slopsmith-desktop" "${pkgdir}/usr/bin/slopsmith-desktop"

    # SUID chrome-sandbox so Electron works on kernels without unprivileged userns
    chmod 4755 "${pkgdir}/opt/Slopsmith/chrome-sandbox"
}
