# Maintainer: shrimp <james@shrimp.wtf>
#
# Linear's desktop client is a pure-JS Electron app (no Linux build is published).
# This repackages app.asar from the official Windows installer and runs it on the
# system Electron, so Chromium/Electron security updates come from pacman.
#
# Updates are automated by scripts/update.sh (GitHub Actions), which bumps pkgver,
# the installer checksum and _electron (the Electron major bundled in the release).

pkgname=linear-bin
pkgver=1.32.7
pkgrel=1
pkgdesc="Linear desktop client, repackaged from the official release to run on system Electron"
arch=('any')
url="https://linear.app"
license=('LicenseRef-custom')
_electron=electron44
depends=("${_electron}" 'hicolor-icon-theme' 'xdg-utils')
makedepends=('7zip' 'icoutils' 'asar')
optdepends=('libnotify: desktop notification when a new Linear release is available'
            'curl: new release check on launch')
provides=('linear' 'linear-desktop')
conflicts=('linear-desktop' 'linear-desktop-bin' 'linear-desktop-git')
options=('!strip' '!debug')
_installer="Linear-Setup-${pkgver}.exe"
source=("${_installer}::https://releases.linear.app/Linear%20Setup%20${pkgver}.exe"
        'linear-desktop'
        'linear.desktop'
        'linear-chrome.main.js'
        'linear-chrome.preload.js')
noextract=("${_installer}")
sha256sums=('d670adb29c1f8fc77008cc76111bdc88523dcabf718e45b9d3ac47d17de7eae3'
            '53a3034e6b26d1179e09ed824c90c215150fa9417f734c05b4c9cebe118535e3'
            '0682a91753346ab2d5703ea470b61066f4e890b785fd2a83138fd72e03ba8f0d'
            '2b9ef7f8d32d44be4d57fdf10b0a197ef0d5638502dfb0f4d28d71c430f3170c'
            'bd88025c01c59da7c6e389063498687ef8fde71153c09bc816064dd856bc886c')

prepare() {
  # NSIS installer -> embedded app archive -> app.asar + exe (icon resource only)
  7z x -y -o"${srcdir}/nsis" "${srcdir}/${_installer}" '$PLUGINSDIR/app-64.7z' >/dev/null
  7z x -y -o"${srcdir}/app" "${srcdir}/nsis/\$PLUGINSDIR/app-64.7z" resources/app.asar Linear.exe >/dev/null

  mkdir -p "${srcdir}/icons"
  wrestool -x -t14 "${srcdir}/app/Linear.exe" -o "${srcdir}/icons/linear.ico"
  icotool -x -o "${srcdir}/icons" "${srcdir}/icons/linear.ico"

  # Frameless window with Linear-styled controls. Each anchor must match exactly so an
  # upstream change fails the build instead of shipping a half-patched app.
  asar extract "${srcdir}/app/resources/app.asar" "${srcdir}/app-src"
  local anchor='titleBarStyle:DV?`hidden`:`default`'
  grep -qF -- "${anchor}" "${srcdir}/app-src/out/main/index.js" || { echo 'titlebar anchor not found'; return 1; }
  sed -i 's/titleBarStyle:DV?`hidden`:`default`/titleBarStyle:DV||process.platform===`linux`?`hidden`:`default`/' \
    "${srcdir}/app-src/out/main/index.js"
  cat "${srcdir}/linear-chrome.main.js" >> "${srcdir}/app-src/out/main/index.js"
  cat "${srcdir}/linear-chrome.preload.js" >> "${srcdir}/app-src/out/preload/index.js"
  asar pack "${srcdir}/app-src" "${srcdir}/app.asar"
}

package() {
  install -Dm644 "${srcdir}/app.asar" "${pkgdir}/usr/lib/linear-desktop/app.asar"
  echo "${pkgver}" > "${pkgdir}/usr/lib/linear-desktop/VERSION"

  sed "s/@ELECTRON@/${_electron}/" "${srcdir}/linear-desktop" > "${srcdir}/linear-desktop.out"
  install -Dm755 "${srcdir}/linear-desktop.out" "${pkgdir}/usr/bin/linear-desktop"
  install -Dm644 "${srcdir}/linear.desktop" "${pkgdir}/usr/share/applications/linear.desktop"

  local png size
  for png in "${srcdir}"/icons/*.png; do
    size=$(sed -E 's/.*_([0-9]+)x[0-9]+x[0-9]+\.png$/\1/' <<<"${png}")
    install -Dm644 "${png}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linear-desktop.png"
  done
}
