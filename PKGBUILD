# Maintainer: Ariejan de Vroom <ariejan.de.vroom@kabisa.nl>
pkgname=slopsmith-desktop-testing-bin
_pkgname=slopsmith-desktop
_upstream_ver=0.2.9-alpha.5
pkgver=0.2.9.alpha.5
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
sha256sums=('5af3ee1369635bd21ae93356d82b046aa3b388b0ef8efce5074df8cd738ca9b4')
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
