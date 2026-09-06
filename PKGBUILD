# Maintainer: minato <i at asukaminato dot eu dot org>

pkgname=noteey
pkgver=1.62.0
pkgrel=1
pkgdesc='Visual note-taking app for organizing complex knowledge and ideas'
arch=('x86_64')
url='https://noteey.com/'
license=('MIT')
depends=(
  'electron39'
  'hicolor-icon-theme'
)
makedepends=(
  'asar'
  'p7zip'
)
provides=('noteey')
conflicts=('noteey')
options=('!strip')
source=(
  "Noteey-Setup-${pkgver}.exe::https://github.com/andyyoungm/muenzo/releases/download/v${pkgver}/Noteey-Setup-${pkgver}.exe"
  'noteey'
  'noteey.desktop'
)
sha256sums=('970bd0c0ace8dba21335f88fc71841dee8e5ca748ea37ba3dfe3b8450d3b1546'
            '908962ed7ba279d99be249507b75b1afd7b4cf72b80b60313b4c1d139e425ca3'
            '13d71ff65bef1e87d0db3650d84292c5c9ec58e2d94723415717df602dff5975')

prepare() {
  rm -rf "$srcdir/extracted" "$srcdir/app"
  mkdir -p "$srcdir/extracted" "$srcdir/app"

  7z x "$srcdir/Noteey-Setup-${pkgver}.exe" \
    "-o$srcdir/extracted" \
    '$PLUGINSDIR/app-64.7z'
  7z x "$srcdir/extracted/\$PLUGINSDIR/app-64.7z" \
    "-o$srcdir/extracted" \
    'resources/app.asar' \
    'resources/node_modules/*'

  asar extract "$srcdir/extracted/resources/app.asar" "$srcdir/app"
  cp -a "$srcdir/extracted/resources/node_modules" "$srcdir/app/node_modules"

  local main_js="$srcdir/app/index.js"
  sed -i \
    -e '1aObject.defineProperty(app, "isPackaged", { get: () => true });' \
    -e '2aif (process.platform === "linux") app.setDesktopName("noteey.desktop");' \
    -e "s/    autoUpdater.checkForUpdates();/    sendMessageUpdate('update-not-available');/" \
    -e "s/    autoUpdater.downloadUpdate();/    sendMessageUpdate('update-not-available');/" \
    -e "s/    autoUpdater.quitAndInstall();/    sendMessageUpdate('update-not-available');/" \
    -e 's/  app.setAsDefaultProtocolClient/  process.platform !== "linux" \&\& app.setAsDefaultProtocolClient/' \
    "$main_js"
  grep -Fqx 'Object.defineProperty(app, "isPackaged", { get: () => true });' "$main_js"
  grep -Fqx 'if (process.platform === "linux") app.setDesktopName("noteey.desktop");' "$main_js"
  ! grep -Eq '^    autoUpdater\.(checkForUpdates|downloadUpdate|quitAndInstall)' "$main_js"
  ! grep -Eq '^  app\.setAsDefaultProtocolClient' "$main_js"
}

package() {
  install -dm755 "$pkgdir/usr/lib/noteey"
  cp -a --no-preserve=ownership "$srcdir/app" "$pkgdir/usr/lib/noteey/app"

  install -Dm755 noteey "$pkgdir/usr/bin/noteey"
  install -Dm644 noteey.desktop \
    "$pkgdir/usr/share/applications/noteey.desktop"
  install -Dm644 "$srcdir/app/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/noteey.png"
}
