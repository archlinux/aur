# Maintainer: Fadilah Riczky (itsmefdil) <friczky@gmail.com>

pkgname=termimus-ssh-bin
_pkgname=termimus
pkgver=0.9.0
pkgrel=2
pkgdesc="Self-hosted SSH & Server Manager desktop app (Termius alternative built with Tauri + React)"
arch=('x86_64')
url="https://github.com/termimus/termimus-ssh"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
)
provides=('termimus' 'termimus-ssh')
conflicts=('termimus' 'termimus-ssh')
options=('!debug' '!strip')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/termimus/termimus-ssh/releases/download/v${pkgver}/Termimus_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/termimus/termimus-ssh/v${pkgver}/LICENSE"
)
sha256sums=(
    '819292755f83cd16654a1ad6989d0095083d29c6427410d180d1d3f9b2279a18'
    '29309b165d9ba5ce70bc0cc32696d034dca05f568cb7b20c87a41ff01ba3cf82'
)

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Move binary to /usr/lib and create wrapper for WebKitGTK DMA-BUF/GBM compatibility
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

    cat <<'EOF' > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
# Workaround for WebKitGTK DMA-BUF / GBM buffer allocation issues (e.g. on NVIDIA / Wayland)
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
exec /usr/lib/termimus/termimus "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink command alias
    ln -sf termimus "${pkgdir}/usr/bin/termimus-ssh"

    # Fix desktop categories
    if [ -f "${pkgdir}/usr/share/applications/Termimus.desktop" ]; then
        sed -i 's/^Categories=$/Categories=Network;Utility;System;/' "${pkgdir}/usr/share/applications/Termimus.desktop"
    fi

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
