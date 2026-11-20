# Maintainer: colegeming <collegeming@outlook.com>

pkgname=openchamber-arch-bin
pkgver=2.7.3
pkgrel=1
pkgdesc='OpenChamber desktop application (official prebuilt Linux binary)'
arch=('x86_64' 'aarch64')
url='https://openchamber.dev/'
license=('MIT')
# Electron runtime dependencies, mapped from the .deb's Depends to Arch names.
depends=(
    'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gtk3'
    'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb'
    'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
    'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
    'systemd-libs' 'util-linux' 'xdg-utils'
)
optdepends=('libayatana-appindicator: StatusNotifierItem tray icon support')
makedepends=('patchelf')
# resources/opencode-cli/opencode is a Bun standalone binary; stripping breaks it.
options=('!strip' '!debug')
conflicts=(
    'openchamber-bin'
    'openchamber-desktop'
    'openchamber-desktop-git'
    'openchamber-desktop-appimage'
)

# The payload is the upstream .deb; only the license text comes from the repo at
# the release tag (see [extras.license] in metadata.toml).
source_x86_64=(
    "OpenChamber-${pkgver}-linux-amd64.deb::https://github.com/openchamber/openchamber/releases/download/v${pkgver}/OpenChamber-2.7.3-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/openchamber/openchamber/v2.7.3/LICENSE"
)
sha256sums_x86_64=('d9bfb0e3bbb4dfc5861ed9c2dd3ea8e46700101f4d4d89912f1f0f42957aee4a' '1f6e869a3feff6b4eb07907afc89176562b1f4324389f163d9fd94f09864b44e')
source_aarch64=(
    "OpenChamber-${pkgver}-linux-arm64.deb::https://github.com/openchamber/openchamber/releases/download/v${pkgver}/OpenChamber-2.7.3-linux-arm64.deb"
    "LICENSE::https://raw.githubusercontent.com/openchamber/openchamber/v2.7.3/LICENSE"
)
sha256sums_aarch64=('3a126521a10b9a9c3b2c6f24ca70bdd481342fa8e2494ee79d4904c10efffa8a' '1f6e869a3feff6b4eb07907afc89176562b1f4324389f163d9fd94f09864b44e')

package() {
    local deb
    case "${CARCH}" in
        x86_64)  deb="OpenChamber-${pkgver}-linux-amd64.deb" ;;
        aarch64) deb="OpenChamber-${pkgver}-linux-arm64.deb" ;;
        *) echo "unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    cd "${srcdir}"

    # A .deb is an ar container; libarchive reads the container but does not
    # recurse into its members, so unpack it once and extract data.tar.*.
    mkdir -p deb-archive
    bsdtar -xf "${deb}" -C deb-archive
    bsdtar -xf deb-archive/data.tar.* -C "${pkgdir}"

    local appdir="${pkgdir}/opt/OpenChamber"

    # Debian-only updater selector (would try apt) and a Debian/Ubuntu profile
    # that hardcodes the upstream install path.
    rm -f "${appdir}/resources/package-type" "${appdir}/resources/apparmor-profile"

    # Upstream ships the Chromium sandbox helper 0777. Keep it non-setuid: Arch
    # enables unprivileged user namespaces, which is what Electron uses here.
    chmod 0755 "${appdir}/chrome-sandbox"

    # The sherpa-onnx native modules carry the build machine's RUNPATH
    # (/build/install/lib); their libraries sit in the same directory.
    local sherpa
    for sherpa in "${appdir}"/resources/app.asar.unpacked/node_modules/sherpa-onnx-linux-*; do
        [ -d "${sherpa}" ] || continue
        find "${sherpa}" -type f \( -name '*.so' -o -name '*.node' \) \
            -exec patchelf --set-rpath '$ORIGIN' {} +
    done

    # Arch launcher. /usr/bin/openchamber is deliberately left to the separate
    # OpenChamber CLI/web package.
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openchamber-desktop" <<'EOF'
#!/bin/sh
exec /opt/OpenChamber/openchamber "$@"
EOF

    sed -i 's|^Exec=.*|Exec=openchamber-desktop %U|' \
        "${pkgdir}/usr/share/applications/openchamber.desktop"
    chmod 0644 "${pkgdir}/usr/share/applications/openchamber.desktop"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
