# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.38.6
pkgrel=3
pkgdesc="Reasonix Desktop - Electron desktop client for the DeepSeek-native AI coding agent"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
# The official app includes its pinned Electron runtime; no system electron
# package is needed. These are its Linux shared-library/runtime dependencies.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'libxss' 'mesa' 'nspr' 'nss' 'pango'
         'systemd-libs' 'xdg-utils')
provides=('deepseek-reasonix-desktop' 'reasonix-desktop')
conflicts=('deepseek-reasonix-desktop' 'reasonix-desktop')
options=('!strip' '!debug')

_relurl="${url}/releases/download/desktop-v${pkgver}"
source=("${pkgname}-${pkgver}.deb::${_relurl}/Reasonix-linux-amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/desktop-v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('ddb93041b4128a998b35ae3718be46cf07f6ede857a10a624503769449f305ef'
            'dc024237821ac82056c37f8d82e3be919bd51e39a4529ec12a8ab3e2a346dc4c')

prepare() {
    mkdir -p "${srcdir}/debroot"
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz \
        | bsdtar -xf - -C "${srcdir}/debroot"
}

package() {
    cd "${srcdir}/debroot"
    install -d "${pkgdir}/usr/lib/reasonix" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership usr/lib/reasonix/app "${pkgdir}/usr/lib/reasonix/"
    # The upstream bundle root is 0700; make the installed shell accessible
    # to normal users without changing executable or sandbox permissions.
    chmod 755 "${pkgdir}/usr/lib/reasonix/app"

    # Keep the matching service, CLI sidecar and launcher together. Upstream's
    # launcher resolves its real location and finds the regular sibling service;
    # that service resolves app/Reasonix and its CLI beside itself. The private
    # CLI is required for remote uploads but must not own the TUI's /usr/bin/reasonix.
    local _bin
    for _bin in reasonix reasonix-desktop reasonix-launcher; do
        install -Dm755 "usr/bin/${_bin}" "${pkgdir}/usr/lib/reasonix/${_bin}"
    done
    ln -s ../lib/reasonix/reasonix-desktop "${pkgdir}/usr/bin/reasonix-desktop"
    ln -s ../lib/reasonix/reasonix-launcher "${pkgdir}/usr/bin/reasonix-launcher"
    chmod 4755 "${pkgdir}/usr/lib/reasonix/app/chrome-sandbox"

    # Do not install Debian's update-helper/polkit policy or the legacy guard;
    # pacman owns upgrades. Do not disable Chromium's sandbox.
    # Native Wayland windows identify as "reasonix"; desktop IDs are case-sensitive.
    install -Dm644 usr/share/applications/reasonix.desktop \
        "${pkgdir}/usr/share/applications/reasonix.desktop"
    sed -i 's/^StartupWMClass=.*/StartupWMClass=Reasonix/' \
        "${pkgdir}/usr/share/applications/reasonix.desktop"
    local _icon _dir
    for _icon in usr/share/icons/hicolor/*/apps/reasonix-desktop.*; do
        _dir="$(basename "$(dirname "$(dirname "${_icon}")")")"
        install -Dm644 "${_icon}" \
            "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/$(basename "${_icon}")"
    done
    install -Dm644 usr/share/pixmaps/reasonix-desktop.png \
        "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
