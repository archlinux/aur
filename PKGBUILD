# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: Filip Papaj <denuvo at tuta dot io>

_pkgname=zen-browser-twilight
pkgname=${_pkgname}-bin
pkgver=1.23t.20260906
pkgrel=1
pkgdesc='Zen Browser (Twilight Build) - Performance oriented Firefox-based web browser'
arch=('x86_64' 'aarch64')
url='https://zen-browser.app/'
license=('MPL-2.0')
depends=(
    'dbus-glib'
    'gtk3'
    'libxt'
    'mime-types'
    'nss'
    'ttf-font'
)
optdepends=(
    'alsa-lib: ALSA audio backend'
    'ffmpeg: H264/AAC/MP3 decoding'
    'pulse-native-provider: PulseAudio/PipeWire audio backend'
    'libnotify: Desktop notification support'
    'networkmanager: Location detection via WiFi networks'
    'speech-dispatcher: Text-to-Speech'
    'hunspell-en_US: Spell checking, American English'
    'xdg-desktop-portal: Screen sharing under Wayland'
)
provides=("zen-browser=$pkgver")
conflicts=('zen-browser' 'zen-browser-bin' 'zen-browser-git')
options=('!strip' '!debug')
install=${pkgname}.install

_gh='https://github.com/zen-browser/desktop/releases/download/twilight-1'
_installdir="/opt/${pkgname}"

source=("${_pkgname}.sh"
        "${_pkgname}.desktop"
        'policies.json')
source_x86_64=("zen.linux-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz")
source_aarch64=("zen.linux-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-aarch64.tar.xz")
b2sums=('bc733dba0aad89145425cf6e82a22379c1115b736f0938203e80d7e78f3e0f4c6a4c6abab0ceb36d5eecb009163b77d0b8f2145ffcf6b985a8f142f6fabaec6d'
        'f75e803fa9da53ab9c263cc357f388de87137393fac90e86dfb528029de1434d887c2c25050ea167fbe9959d2eec11f81c85f28010126bd0c46884b59bb6ae41'
        'f83302f32649f214d97f2cadf41d353d7d76fc3b50b6dabc6e25256dc52b7a98aed024a14a88966d0a4f18ee5546ad8f45b4de626aa6ed38c9f8e7a99ef151c3')
b2sums_x86_64=('8ab334cb3c52d51be026f50165fd4c3470a22783e8c4c567eeab5607b8702a0d21906c91d5092d1e41320c6aa69d568f298d76e2b679f520443f43f215ff5c18')
b2sums_aarch64=('a467cd8e249b3218cee454fda03e04ca3ca508cb72840ad4f5f30fb44c85759d381d97840598ae8e4129000da841907299bccfa5e5568ab365286617f11e6043')

package() {
    # Browser files
    install -d "${pkgdir}${_installdir}"
    cp -a "${srcdir}/zen/." "${pkgdir}${_installdir}/"

    # SUID sandbox helpers
    local _suid_bins=(glxtest vaapitest)
    for _bin in "${_suid_bins[@]}"; do
        [[ -f "${pkgdir}${_installdir}/${_bin}" ]] && chmod 4755 "${pkgdir}${_installdir}/${_bin}"
    done

    # Launcher
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons — symlink to bundled icons
    local _i
    for _i in 16 32 48 64 128; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps"
        ln -s "${_installdir}/browser/chrome/icons/default/default${_i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps/${_pkgname}.png"
    done

    # System dictionaries & hyphenation
    ln -Ts /usr/share/hunspell "${pkgdir}${_installdir}/dictionaries"
    ln -Ts /usr/share/hyphen "${pkgdir}${_installdir}/hyphenation"

    # System certificates (use system NSS CKBI instead of bundled)
    ln -sf /usr/lib/libnssckbi.so "${pkgdir}${_installdir}/libnssckbi.so"

    # Policies — disable auto-update (managed via AUR)
    install -Dm644 "${srcdir}/policies.json" "${pkgdir}${_installdir}/distribution/policies.json"
}
