# Maintainer: Gaou Piou <i.am.piou@gmail.com>

pkgname=anycode-bin
pkgver=0.0.101
pkgrel=1
pkgdesc='Desktop workspace for AI coding agents (Claude Code, Codex and native)'
arch=('x86_64')
url='https://github.com/incadawr/anycode'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libdrm'
  'mesa'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'nss'
)
optdepends=(
  'libsecret: encrypted storage for provider API keys through the OS keyring'
  'xdg-utils: open external links from the app'
)
provides=('anycode')
conflicts=('anycode')
options=('!strip' '!debug')

# Upstream publishes Linux only as an x86_64 AppImage. It is unpacked at build
# time instead of being run through FUSE, so the package installs like a normal
# application and does not need fuse2 at runtime. The bundled AppRun is kept as
# the launcher: it exports the bundled libraries, the icon/glib data paths and
# probes user namespaces to decide whether Electron needs --no-sandbox.
source=("AnyCode-${pkgver}.AppImage::https://github.com/incadawr/anycode/releases/download/v${pkgver}/AnyCode-${pkgver}.AppImage"
        'LICENSE'
        'anycode.desktop'
        'anycode.sh')
sha256sums=('09847295f6c7fe8d6d61f5c9380ce45250728382d356e7e0777f123157357e6b'
            'f65fd74511d34e143f022c7fdf7f8ee7d4ca9321d80e7390ce3f5147f0f94e34'
            '3c2d00cc5435742a1cfe69d9733786934492bd0c474077c039d8c11665e8427f'
            'd2173b4ad832386fdef35329734ebf7900c4910460792039992b0ebc712cde83')

prepare() {
  chmod +x "${srcdir}/AnyCode-${pkgver}.AppImage"
  ( cd "${srcdir}" && "./AnyCode-${pkgver}.AppImage" --appimage-extract >/dev/null )
}

package() {
  install -dm755 "${pkgdir}/opt/anycode"
  cp -a --no-preserve=ownership "${srcdir}/squashfs-root/." "${pkgdir}/opt/anycode/"

  # The AppImage is assembled with mode 700 directories, which would leave
  # /opt/anycode inaccessible to regular users. a+rX keeps the executable bits
  # it already has and makes the tree readable again.
  chmod -R a+rX "${pkgdir}/opt/anycode"

  # The AppImage ships legacy GTK2 tray libraries that this app never loads and
  # whose own dependencies (gtk2, dbus-glib, libdbusmenu) are not packaged
  # here. Drop them instead of shipping shared libraries with unmet deps.
  rm -f "${pkgdir}/opt/anycode/usr/lib/libappindicator.so.1" \
        "${pkgdir}/opt/anycode/usr/lib/libindicator.so.7" \
        "${pkgdir}/opt/anycode/usr/lib/libgconf-2.so.4"

  # node-pty bundles Windows-only build helpers whose Python scripts are never
  # used on Linux; removing them keeps python out of the dependency graph.
  rm -rf "${pkgdir}/opt/anycode/resources/app.asar.unpacked/node_modules/node-pty/deps/winpty/misc"

  install -Dm755 "${srcdir}/anycode.sh" "${pkgdir}/usr/bin/anycode"

  install -Dm644 "${srcdir}/anycode.desktop" \
    "${pkgdir}/usr/share/applications/anycode.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/AnyCode.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/anycode.png"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
