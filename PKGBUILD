# Maintainer: esocidae <slusheliott@gmail.com>
# pkgver/pkgrel/sha256sums below are placeholders; the release workflow
# (.github/workflows/release.yml, aur-publish job) overwrites them per release.
pkgname=grimoire-bin
_pkgname=grimoire
pkgver=1.23.0
pkgrel=1
pkgdesc="Mod manager and companion tool for Deadlock (GameBanana browser, hero locker, crosshair designer)"
arch=('x86_64')
url="https://github.com/Slush97/grimoire"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug' '!emptydirs')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/grimoire_${pkgver}_amd64.deb")
sha256sums=('c0476f3f7ff79606df2a72b39cb2447181c2dce5b6cca794454846369e0d6190')

package() {
    cd "${srcdir}"
    bsdtar -xf "${_pkgname}-${pkgver}.deb" data.tar.xz
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Electron's sandbox helper needs setuid root.
    chmod 4755 "${pkgdir}/opt/Grimoire/chrome-sandbox"

    # The .deb omits /usr/bin/grimoire; add it so the binary is on PATH.
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Grimoire/grimoire "${pkgdir}/usr/bin/${_pkgname}"

    # Drop debian-style changelog; pacman handles its own.
    rm -rf "${pkgdir}/usr/share/doc"
}
