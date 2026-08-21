# Maintainer: moyigeek <moyi@openatom.club>

pkgname=siyuan-unlock
pkgver=3.7.3
pkgrel=1
pkgdesc='Privacy-first personal knowledge management software (prebuilt binary)'
arch=('x86_64')
url='https://b3log.org/siyuan/en/'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'libxss' 'musl' 'nss' 'libxtst' 'xdg-utils')
provides=('siyuan')
conflicts=('siyuan')
options=('!strip')
source=("https://github.com/appdev/siyuan-unlock/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz")
sha256sums=('5d3f08d93631085cccc0c8fe89016f66b6e451606cc0da78ed42554b1242dcb7')
sha512sums=('8b7aa6261c0943064412ddb11248cbc53e1798c2176ddd4a649f17a4e002d65ec47e0f73b31517cb4701402c0ecf535066f3c72058de5107bb9d7df9f073dd86')

package() {
    local appdir="${pkgdir}/opt/siyuan"

    install -d "${appdir}"
    cp -r "siyuan-${pkgver}-linux/." "${appdir}/"

    # Electron requires the sandbox helper to be owned by root and setuid.
    chmod 4755 "${appdir}/chrome-sandbox"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/siyuan" <<'EOF'
#!/bin/bash

if [[ -n ${WAYLAND_DISPLAY:-} || ${XDG_SESSION_TYPE:-} == wayland ]]; then
    exec /opt/siyuan/siyuan --ozone-platform=x11 "$@"
fi

exec /opt/siyuan/siyuan "$@"
EOF

    install -Dm644 "${appdir}/resources/stage/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.b3log.siyuan.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/org.b3log.siyuan.desktop" <<'EOF'
[Desktop Entry]
Name=SiYuan
Comment=Refactor your thinking
Exec=siyuan %U
Icon=org.b3log.siyuan
Terminal=false
Type=Application
Categories=Office;Utility;
MimeType=x-scheme-handler/siyuan;
StartupWMClass=SiYuan
EOF

    install -Dm644 "${appdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${appdir}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${appdir}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
