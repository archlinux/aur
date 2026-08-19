pkgname=waveloggate-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="CAT and WSJT-X Bridge for WaveLog (prebuilt binary)"
arch=('x86_64')
url="https://github.com/wavelog/WaveLogGate"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'hamlib'
)
provides=('waveloggate')
conflicts=('waveloggate' 'waveloggate-git')
options=(!strip !lto !debug)
source=("waveloggate-${pkgver}.deb::${url}/releases/download/v${pkgver}/wavelog-gate_${pkgver}_webkit4.1_amd64.deb")
sha256sums=('4184ea12fe0ed2f3f1e3ad58af09258afac9c1527bf335eb38ce417f1ae930f5')

prepare() {
    # makepkg/bsdtar unpacks the outer .deb (ar archive); extract the payload.
    bsdtar -xf data.tar.* -C "${srcdir}"
}

package() {
    install -Dm755 "${srcdir}/usr/local/bin/wavelog-gate" "${pkgdir}/usr/bin/wavelog-gate"
    install -Dm644 "${srcdir}/usr/share/applications/wavelog-gate.desktop" \
        "${pkgdir}/usr/share/applications/wavelog-gate.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/wavelog-gate.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wavelog-gate.png"

    # The upstream .desktop points at /usr/local/bin; fix it for the Arch layout.
    sed -i 's|/usr/local/bin/wavelog-gate|/usr/bin/wavelog-gate|' \
        "${pkgdir}/usr/share/applications/wavelog-gate.desktop"
}
