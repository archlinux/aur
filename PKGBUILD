# Maintainer: PrettyZap contributors
#
# This package intentionally installs the upstream AppImage contents instead
# of depending on Arch's moving Electron runtime. That keeps the WhatsApp Web
# shell on the Electron version it was tested with across Arch derivatives.

pkgname=prettyzap-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='Keyboard-first Electron shell around WhatsApp Web'
arch=('x86_64')
url='https://github.com/prettyletto/prettyzap'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fontconfig'
         'glib2' 'gtk3' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
         'mesa' 'nss' 'pango' 'wayland' 'xdg-utils')
optdepends=('libsecret: keyring integration for Chromium credentials'
            'pipewire: desktop audio integration')
options=('!strip')
source=("PrettyZap-${pkgver}.AppImage::https://github.com/prettyletto/prettyzap/releases/download/v${pkgver}/PrettyZap-${pkgver}.AppImage"
        'prettyzap.svg'
        'prettyzap.desktop'
        'LICENSE')
sha256sums=('73978745e29bd58479f26c1ed406909e29f04ab0a7fe9b518ad4c0326a08f873'
           'dc32d09b142dec2ace99bafae3f9e374e863c70d64e529ad815ac6ba51eb605a'
           '4a8aa9bd6ce4b408c04553cc4984bd6bf64c5a2e726d8f5af3e8b50efffc6d99'
           'e1353e4dde193ae18c47ba11139aad7e907f4609ae23e866d206e1d01e9f37b3')

prepare() {
  chmod 0755 "PrettyZap-${pkgver}.AppImage"
}

package() {
  "${srcdir}/PrettyZap-${pkgver}.AppImage" --appimage-extract >/dev/null

  install -d "${pkgdir}/opt/prettyzap"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/prettyzap/"
  rm -f "${pkgdir}/opt/prettyzap/.DirIcon"
  # AppImage extraction preserves its source-owner-only permissions. The
  # package is installed system-wide, so normalize traversal/read permissions
  # and retain executable bits for AppRun and Electron helper binaries.
  chmod -R a+rX "${pkgdir}/opt/prettyzap"

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/prettyzap" <<'EOF'
#!/bin/sh
exec /opt/prettyzap/AppRun "$@"
EOF

  install -Dm0644 "${srcdir}/prettyzap.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/prettyzap.svg"
  install -Dm0644 "${srcdir}/prettyzap.svg" \
    "${pkgdir}/usr/share/pixmaps/prettyzap.svg"
  install -Dm0644 "${srcdir}/prettyzap.desktop" \
    "${pkgdir}/usr/share/applications/prettyzap.desktop"
  install -Dm0644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
