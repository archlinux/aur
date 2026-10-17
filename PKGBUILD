# Maintainer: YOUR NAME <YOUR EMAIL>
pkgname=kortix-desktop
pkgver=0.14.0
pkgrel=1
pkgdesc='Kortix desktop application (official binary)'
arch=('x86_64')
url='https://kortix.com'
license=('Elastic-2.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
makedepends=('squashfs-tools')
optdepends=('xdg-utils: desktop integration')
options=('!strip' '!debug')
_image="Kortix-${pkgver}-x86_64.AppImage"
source=("https://github.com/kortix-ai/suna/releases/download/v${pkgver}/${_image}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/kortix-ai/suna/v${pkgver}/LICENSE")
noextract=("${_image}")
sha256sums=('fd4a779b6e8664c675c7859b7dd711f6d03e3eb6a799dd98b44b1f8ee4ee1a14'
            '48255018b41fc0e965b1115af7e6779bc218bb8a6747d561da800d5022622aa2')

prepare() {
  chmod +x "${_image}"
  "./${_image}" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/kortix-desktop" "${pkgdir}/usr/bin"
  cp -a squashfs-root/. "${pkgdir}/opt/kortix-desktop/"

  # Use Chromium's setuid sandbox, never --no-sandbox.
  if [[ -f "${pkgdir}/opt/kortix-desktop/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/kortix-desktop/chrome-sandbox"
  fi
  ln -s /opt/kortix-desktop/AppRun "${pkgdir}/usr/bin/kortix-desktop"

  local desktop icon
  for desktop in squashfs-root/*.desktop; do
    [[ -f "${desktop}" ]] || continue
    install -Dm644 "${desktop}" "${pkgdir}/usr/share/applications/kortix-desktop.desktop"
    sed -i -E \
      -e 's|^Exec=.*|Exec=/usr/bin/kortix-desktop %U|' \
      -e 's|^Icon=.*|Icon=kortix-desktop|' \
      -e '/^TryExec=/d' \
      "${pkgdir}/usr/share/applications/kortix-desktop.desktop"
    break
  done
  test -f "${pkgdir}/usr/share/applications/kortix-desktop.desktop"
  # electron-builder places the application icon at the AppDir root.
  for icon in squashfs-root/*.png; do
    [[ -f "${icon}" ]] || continue
    install -Dm644 "${icon}" "${pkgdir}/usr/share/pixmaps/kortix-desktop.png"
    break
  done
  test -f "${pkgdir}/usr/share/pixmaps/kortix-desktop.png"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
