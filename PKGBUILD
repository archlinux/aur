# Maintainer: czyt <czytcn@gmail.com>
pkgname=linger-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Personal AI agent that runs a local model on your own machine, turning mail, chats and meetings into shared memory"
arch=('x86_64')
url="https://github.com/simplexai-labs/linger"
# A modified Apache 2.0: hosting Linger for others and removing its logo need
# the producer's permission. The licence text travels with the package.
license=('LicenseRef-Linger')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'cups' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
provides=('linger')
conflicts=('linger')
# The bundle is a finished Electron build; stripping it would mean rewriting
# 228 MB of upstream binary for no gain, and a debug package of the same size.
options=('!strip' '!debug')

_tag="desktop-v${pkgver}"
_archive="Linger-${pkgver}-linux-x64.tar.gz"

source=("${_archive}::https://github.com/simplexai-labs/linger/releases/download/${_tag}/${_archive}"
        "linger.svg::https://raw.githubusercontent.com/simplexai-labs/linger/${_tag}/assets/logo-horizontal.svg"
        "LICENSE::https://raw.githubusercontent.com/simplexai-labs/linger/${_tag}/LICENSE")
sha256sums=('f2904f0f9c627558417ae3977e80eb186d64ccdddf724f9f9822a57948d881fd'
            'a0aa9e9fc9f9ba51456486bdacbca16f24234b922a23fe9bedf5ec45dceaf86b'
            'c0885bd7ddca2e3a26648168725d358cd2dc7269e80968a9481dacebb4139e65')

package() {
    local appdir="${srcdir}/Linger-${pkgver}-linux-x64"

    # The Electron runtime is looked up next to the executable, so the whole
    # tree moves together into /usr/lib.
    install -d "${pkgdir}/usr/lib/linger"
    cp -a "${appdir}/." "${pkgdir}/usr/lib/linger/"

    # Chromium's own sandbox helper, as Arch's electron package ships it.
    chmod 4755 "${pkgdir}/usr/lib/linger/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s ../lib/linger/linger "${pkgdir}/usr/bin/linger"

    # The bundle carries no desktop entry or icon of its own.
    install -Dm644 "${srcdir}/linger.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linger.svg"
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/linger.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Linger
Comment=Personal AI agent with a local model
Exec=linger
Icon=linger
Terminal=false
StartupWMClass=Linger
Categories=Utility;
EOF

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
