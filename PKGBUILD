# Maintainer: czyt <czytcn@gmail.com>

pkgname=crossbow-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Proxy client for mihomo with a Tauri desktop interface"
arch=('x86_64')
url="https://github.com/Richard-Zhang1019/Crossbow"
license=('GPL-3.0-only')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libsoup3'
    'webkit2gtk-4.1'
)
optdepends=(
    'iproute2: TUN mode network configuration'
    'libappindicator-gtk3: system tray icon'
    'polkit: authorise the TUN helper'
)
provides=('crossbow')
conflicts=('crossbow')
options=('!strip' '!debug')

_tarball="Crossbow_${pkgver}_linux_x86_64.tar.gz"
_icons="https://raw.githubusercontent.com/Richard-Zhang1019/Crossbow/v${pkgver}/apps/desktop/src-tauri/icons"
source_x86_64=(
    "crossbow-${pkgver}-x86_64.tar.gz::https://github.com/Richard-Zhang1019/Crossbow/releases/download/v${pkgver}/${_tarball}"
    "crossbow-128x128.png::${_icons}/128x128.png"
    "crossbow-512x512.png::${_icons}/icon-source.png"
)
sha256sums_x86_64=('6a74f47629a43e1407f5405fd0ab4718573f5e5ef23aacc4ea356a0659fdb6e0'
                   'f2618a6eea241e5180c4ca110f36c4602cb690680bbfbf9dfe2497a695002830'
                   'c340471988c04135dfa74696d623f7f30f9f64c3e11b47022fe67ddcfec24679')

package() {
    local _src="${srcdir}/Crossbow_${pkgver}_linux_x86_64"
    local _dir="${pkgdir}/usr/lib/crossbow"

    # crossbow-desktop looks for its core and helper at fixed paths under
    # /usr/lib/crossbow, and the polkit action points at the service there, so
    # everything upstream ships stays in one directory.
    install -dm755 "${_dir}"
    install -m755 "${_src}/crossbow-desktop" "${_dir}/crossbow-desktop"
    install -m755 "${_src}/crossbow-service" "${_dir}/crossbow-service"
    install -m755 "${_src}/mihomo" "${_dir}/mihomo"

    install -Dm644 "${_src}/org.crossbow.tun.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/org.crossbow.tun.policy"

    # Upstream launches the app from inside its own directory (run.sh); keep
    # that behaviour so relative lookups behave the same as the tarball.
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/crossbow" <<'EOF'
#!/bin/sh
cd /usr/lib/crossbow || exit 1
exec ./crossbow-desktop "$@"
EOF

    install -Dm644 "${srcdir}/crossbow-128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/crossbow.png"
    install -Dm644 "${srcdir}/crossbow-512x512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/crossbow.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/crossbow.desktop" <<'EOF'
[Desktop Entry]
Name=Crossbow
Comment=Proxy client for mihomo
Exec=crossbow %U
Icon=crossbow
Terminal=false
Type=Application
Categories=Network;
Keywords=proxy;vpn;mihomo;
StartupWMClass=Crossbow-desktop
EOF
}
