# Maintainer: Artem Shustrov <shustrov_a at inbox dot ru>
# Upstream release list: https://gigacode.ru/jarvis/versions
pkgname=gigacode-desktop-bin
pkgver=26.10.109
pkgrel=1
pkgdesc='GigaCode Desktop AI assistant'
arch=('x86_64')
url='https://gitverse.ru/features/gigacode/install/'
license=('unknown')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libgcc' 'libstdc++' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
makedepends=('unzip' 'asar')
options=('!strip' '!debug')
_archive="gigacode-desktop-linux-${pkgver}.zip"
source=("https://gigacode.ru/plugins/${_archive}")
sha256sums=('e8a9fe520ed1c59ecb58b6ed8cd657e182733b0db7867f91cebdc808a230c6d7')
noextract=("${_archive}")

package() {
  local asar_dir size

  install -dm755 "${pkgdir}/opt/gigacode"
  unzip -q "${srcdir}/${_archive}" -d "${pkgdir}/opt/gigacode"

  chmod 644 \
    "${pkgdir}/opt/gigacode/resources/configUrl.txt" \
    "${pkgdir}/opt/gigacode/resources/cli/package/configUrl.txt"

  test -x "${pkgdir}/opt/gigacode/gigacode" || return 1

  # Extract asar resources
  asar_dir=$(mktemp -d "${srcdir}/gigacode-asar.XXXXXX")
  PATH="${pkgdir}/opt/gigacode/resources/nodejs/bin:${PATH}" \
    asar extract "${pkgdir}/opt/gigacode/resources/app.asar" "${asar_dir}"

  # A git subprocess may close stdin before Node finishes writing to it.
  if grep -Fq 'child.stdin.end(input ?? "");' "${asar_dir}/dist-electron/main.cjs"; then
    sed -i 's/child\.stdin\.end(input ?? "");/child.stdin.on("error", (error) => { if (error.code !== "EPIPE") resolve8({ ok: false, stdout, stderr, error: error.message }); }); child.stdin.end(input ?? "");/' \
      "${asar_dir}/dist-electron/main.cjs"
  fi

  for size in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 "${asar_dir}/dist/app-icons/icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/gigacode.png"
  done

  PATH="${pkgdir}/opt/gigacode/resources/nodejs/bin:${PATH}" \
    asar pack "${asar_dir}" "${pkgdir}/opt/gigacode/resources/app.asar"
  rm -rf "${asar_dir}"

  install -dm755 "${pkgdir}/usr/bin"
  # The upstream registration creates a second desktop entry without an icon.
  cat > "${pkgdir}/usr/bin/gigacode-desktop" <<'LAUNCHER'
#!/bin/sh
GIGACODE_SKIP_PROTOCOL_REGISTRATION=1 exec /opt/gigacode/gigacode "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/gigacode-desktop"
  ln -s gigacode-desktop "${pkgdir}/usr/bin/gigacode-deeplink-wrapper.sh"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/gigacode.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=GigaCode Desktop
Comment=AI assistant for development and office work
Exec=gigacode-desktop %u
# KWin resolves the Wayland window icon from this desktop entry.
Icon=/usr/share/icons/hicolor/512x512/apps/gigacode.png
Terminal=false
Categories=Development;
MimeType=x-scheme-handler/gigacode;
StartupNotify=true
StartupWMClass=gigacode
DESKTOP

  install -Dm644 "${pkgdir}/opt/gigacode/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/gigacode/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
