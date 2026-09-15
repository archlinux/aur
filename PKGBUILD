# Maintainer: colegeming <collegeming@outlook.com>

pkgname=siyuan-unlock-bin
pkgver=3.8.3
pkgrel=1
pkgdesc='Privacy-first personal knowledge management software (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://b3log.org/siyuan/en/'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss' 'libxtst' 'xdg-utils')
provides=('siyuan' 'siyuan-unlock')
conflicts=('siyuan' 'siyuan-unlock')
options=('!strip')
source_x86_64=("https://github.com/appdev/siyuan-unlock/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz")
sha256sums_x86_64=('892ff165da8d7e248edf4d647229315c2a34fec074de40f58b83d72fd97e353d')
source_aarch64=("https://github.com/appdev/siyuan-unlock/releases/download/v${pkgver}/siyuan-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('6d6dfe8f5ae3f65e364b3da758e2068c6dd91791ef20d13a0da202767632f0ae')

package() {
    local appdir="${pkgdir}/opt/siyuan"
    local srcdir

    case "${CARCH}" in
        x86_64)  srcdir="siyuan-${pkgver}-linux" ;;
        aarch64) srcdir="siyuan-${pkgver}-linux-arm64" ;;
    esac

    install -d "${appdir}"
    cp -r "${srcdir}/." "${appdir}/"

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