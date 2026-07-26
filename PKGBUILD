# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=paseo-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents (Electron desktop app)"
arch=('x86_64')
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'git'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
provides=("paseo=${pkgver}")
conflicts=('paseo' 'paseo-desktop-bin' 'paseo-appimage')
options=('!strip' '!debug')
install=paseo-bin.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${_github_url}/releases/download/v${pkgver}/Paseo-${pkgver}-x64.tar.gz"
    'paseo.desktop'
    'paseo.sh'
    'paseo.service'
    'paseo-daemon-session.sh'
)
sha256sums=('bf7b5f9b6e83539d1b0810b94cc0c154c9dd40b89821aefdfcc88f0433bcebee'
            '6ae9c520668f639a22f17df7814548056ee46aa99a2886639405297a7b1ef212'
            '635acff5ec0bcce1b9dd5aa373cb1d043b29022bb6918325f8db7304c8828af9'
            'df0d01b98ac405c5c25edbb91d61bb9e05355a57e0e652e00823d6331618d686'
            'cdd7d12b02880dfec1ff8d3f29848088940caa617de7b20fbde43cfa3f2ccb60')

package() {
    local _src="${srcdir}/Paseo-${pkgver}-x64"

    install -d "${pkgdir}/opt/Paseo"
    cp -a "${_src}"/. "${pkgdir}/opt/Paseo/"

    install -Dm755 "${srcdir}/paseo.sh" "${pkgdir}/usr/bin/paseo"

    install -Dm644 "${srcdir}/paseo.desktop" \
        "${pkgdir}/usr/share/applications/paseo.desktop"

    # Session-scoped daemon launcher (bundled ELECTRON_RUN_AS_NODE CLI entry at
    # /opt/Paseo/resources/bin/paseo, full login-shell env) and the static user
    # unit that runs it. Started via XDG autostart, not enabled — see
    # paseo-bin.install.
    install -Dm755 "${srcdir}/paseo-daemon-session.sh" \
        "${pkgdir}/usr/bin/paseo-daemon-session"

    install -Dm644 "${srcdir}/paseo.service" \
        "${pkgdir}/usr/lib/systemd/user/paseo.service"

    install -Dm644 "${_src}/resources/app-dist/pwa-icon-192.png" \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/paseo.png"
    install -Dm644 "${_src}/resources/app-dist/pwa-icon-512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/paseo.png"

    install -Dm644 "${_src}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
