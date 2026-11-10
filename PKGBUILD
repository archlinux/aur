# Maintainer: minpeter <minpeter@users.noreply.github.com>
# Contributor: minpeter <kali2005611@gmail.com>
# Repository: https://github.com/minpeter/aur-epic-games-launcher-bin

pkgname=epic-games-launcher-bin
pkgver=0.113.1
_commit=g311e678
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
provides=("epic-games-launcher=${pkgver}")
conflicts=('epic-games-launcher')
options=('!debug' '!strip')

_deb="EpicGamesLauncher-${pkgver}-${_commit}-x86_64.deb"
source=("${_deb}::https://content-download-egs.distro.on.epicgames.com/Builds/EGLv2/${pkgver}%2B${_commit}/Linux/EpicGamesLauncher-x86_64.deb")
noextract=("${_deb}")
sha256sums=('637283be11eaefab644917abd16b70c48aed8527c05629062c8882fcd30cea43')

prepare() {
  rm -rf "${srcdir}/deb"
  mkdir -p "${srcdir}/deb/data"
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}/deb"
  bsdtar -xf "${srcdir}"/deb/data.tar.* -C "${srcdir}/deb/data"
}

package() {
  cd "${srcdir}/deb/data"

  install -Dm755 usr/bin/EpicGamesLauncher \
    "${pkgdir}/usr/lib/epic-games-launcher/bin/EpicGamesLauncher"
  install -Dm755 usr/lib/epic-games-launcher/libEOSSDK-Linux-Shipping.so \
    "${pkgdir}/usr/lib/epic-games-launcher/libEOSSDK-Linux-Shipping.so"
  install -Dm644 usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt \
    "${pkgdir}/usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt"
  # RUNPATH $ORIGIN/../lib/epic-games-launcher resolves to the package root.
  install -dm755 "${pkgdir}/usr/lib/epic-games-launcher/lib"
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
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png"

  install -Dm644 usr/lib/epic-games-launcher/resources/ThirdPartyNotices.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
