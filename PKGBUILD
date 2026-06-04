# Maintainer: Manoel Neto <manoel dot carvalhoneto at tutamail dot com>
pkgname=posthog-code-bin
_pkgname=posthog-code
pkgver=0.53.66
pkgrel=1
pkgdesc='Official PostHog Code desktop client (binary release)'
arch=('x86_64')
url='https://posthog.com/code'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'cups'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libdrm'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'xdg-desktop-portal: file chooser and desktop integration'
  'xdg-utils: open external links'
)
provides=('posthog-code')
conflicts=('posthog-code')
options=('!strip' '!debug')
source_x86_64=("https://github.com/PostHog/code/releases/download/v${pkgver}/PostHog.Code-${pkgver}-x64.AppImage")
noextract=("PostHog.Code-${pkgver}-x64.AppImage")
sha256sums_x86_64=('37432f6b8960fdc52c2ba9b2ff8037303ec2b77a2747fa8d188ad2668eda27c0')

package() {
  local appimage="PostHog.Code-${pkgver}-x64.AppImage"

  chmod 755 "${srcdir}/${appimage}"
  rm -rf "${srcdir}/squashfs-root"
  (
    cd "${srcdir}"
    "./${appimage}" --appimage-extract >/dev/null
  )

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/squashfs-root/usr/lib/posthog-code/." "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 /dev/null "${pkgdir}/usr/bin/posthog-code"
  printf '%s\n' \
    '#!/bin/sh' \
    'exec /opt/posthog-code/PostHog\ Code "$@"' \
    > "${pkgdir}/usr/bin/posthog-code"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/posthog-code.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/posthog-code.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/lib/posthog-code/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/posthog-code.desktop"
  printf '%s\n' \
    '[Desktop Entry]' \
    'Version=1.5' \
    'Type=Application' \
    'Name=PostHog Code' \
    'Exec=posthog-code %U' \
    'Icon=posthog-code' \
    'Categories=Development;' \
    'StartupWMClass=PostHog Code' \
    'Terminal=false' \
    > "${pkgdir}/usr/share/applications/posthog-code.desktop"
}
