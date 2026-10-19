# Maintainer: minpeter <minpeter@users.noreply.github.com>
# Contributor: minpeter <kali2005611@gmail.com>
# Repository: https://github.com/minpeter/aur-epic-games-launcher-bin

pkgname=epic-games-launcher-bin
pkgver=0.98.1
_commit=gd6c4f03
pkgrel=1
pkgdesc="Official Epic Games Store launcher (Preview)"
arch=('x86_64')
url="https://launcher.epicgames.com/"
license=('LicenseRef-EpicGamesLauncher')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'libx11'
  'webkit2gtk-4.1'
)
optdepends=(
  'libsecret: store authentication tokens in the system keyring'
  'xdg-utils: open external links in the default browser'
)
makedepends=('7zip')
provides=("epic-games-launcher=${pkgver}")
conflicts=('epic-games-launcher')
options=('!debug' '!strip')

_appimage="EpicGamesLauncher-${pkgver}-${_commit}-x86_64.AppImage"
source=("${_appimage}::https://content-download-egs.distro.on.epicgames.com/Builds/EGLv2/${pkgver}%2B${_commit}/Linux/EpicGamesLauncher-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums=('355d4336435dde07388a3b296946edb501f1f1f59e78fc150003eccb30ec68aa')

prepare() {
  rm -rf "${srcdir}/squashfs-root"
  7z x "${srcdir}/${_appimage}" -o"${srcdir}/squashfs-root" >/dev/null
}

package() {
  cd "${srcdir}/squashfs-root"

  install -Dm755 usr/bin/EpicGamesLauncher \
    "${pkgdir}/usr/lib/epic-games-launcher/bin/EpicGamesLauncher"
  install -Dm755 usr/lib/libEOSSDK-Linux-Shipping.so \
    "${pkgdir}/usr/lib/epic-games-launcher/lib/libEOSSDK-Linux-Shipping.so"
  install -Dm644 usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt \
    "${pkgdir}/usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt"
  ln -s .. "${pkgdir}/usr/lib/epic-games-launcher/lib/epic-games-launcher"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/EpicGamesLauncher" <<'EOF'
#!/bin/sh
export EGL_DISABLE_SELF_UPDATE="${EGL_DISABLE_SELF_UPDATE:-1}"
exec /usr/lib/epic-games-launcher/bin/EpicGamesLauncher "$@"
EOF
  ln -s EpicGamesLauncher "${pkgdir}/usr/bin/epic-games-launcher"

  install -Dm644 usr/share/applications/epic-games-launcher.desktop \
    "${pkgdir}/usr/share/applications/epic-games-launcher.desktop"

  install -Dm644 usr/share/icons/hicolor/32x32/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/EpicGamesLauncher.png"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/EpicGamesLauncher.png"
  install -Dm644 epic-games-launcher.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/EpicGamesLauncher.png"
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png"

  install -Dm644 usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
