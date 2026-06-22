# Maintainer: esocidae <slusheliott@gmail.com>
# pkgver/pkgrel/sha256sums below are placeholders; the release workflow
# (.github/workflows/release.yml, aur-publish job) overwrites them per release.
pkgname=grimoire-bin
_pkgname=grimoire
pkgver=1.21.3
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
sha256sums=('147e7e6ff9b0d12904cfebb6d58c12f8e57a929e69456b986f26374ac5be01ce')

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
