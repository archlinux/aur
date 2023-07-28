# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

_filename=$(
  curl -v --no-progress-meter -r 0-1 https://download.beeper.com/linux/appImage/x64 2>&1 >/dev/null \
    | grep content-disposition \
    | sed -E 's@^.*\bcontent-disposition:.*\bfilename="([^"]+)".*$@\1@'
)

_pkgver=$(
  printf "%s\n" "$_filename" \
    | sed -E 's@^beeper-([0-9]+\.[0-9]+\.[0-9]+).AppImage$@\1@'
)

_pkgname='beeper'
pkgname="$_pkgname-latest-bin"
pkgver=3.66.24
pkgrel=2
pkgdesc="all your chats in one app"
arch=('x86_64')
url="https://beeper.com/"
license=('custom')
depends=(
  'hicolor-icon-theme'
)
makedepends=()
options=('!strip')

source=(
  "$_filename"::"https://download.beeper.com/linux/appImage/x64"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  printf "%s" "$_pkgver"
}

build() {
  cd "$srcdir"

  # extract appimage
  chmod +x "$_filename"
  "$srcdir/$_filename" --appimage-extract

  # fix folder permissions
  find "$srcdir/squashfs-root" -type d -exec chmod 755 {} \;

  # fix apprun script
  sed -Ei \
    's@^(if \[ -z \"\$APPDIR\" ] ; then)$@APPDIR="/opt/beeper"\n\1@' \
    "$srcdir/squashfs-root/AppRun"

  # fix desktop file
  sed -Ei \
    's@^Exec=AppRun (.*)$@Exec=beeper \1@' \
    "$srcdir/squashfs-root/beeper.desktop"
}

package() {
  # apprun script
  install -vDm0755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/beeper"

  # desktop file
  install -vDm0644 "$srcdir/squashfs-root/beeper.desktop"                                  "$pkgdir/usr/share/applications/beeper.desktop"

  # icons
  for s in 16 32 48 64 128 256 512 1024 ; do
    install -vDm0644 \
    "$srcdir/squashfs-root/usr/share/icons/hicolor/${s}x${s}/apps/beeper.png" \
    -t "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps"
  done

  # license files
  install -vDm0644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm0644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$pkgname"

  # everything else
  mkdir -p "$pkgdir/opt"
  mv "$srcdir/squashfs-root" "$pkgdir/opt/beeper"
}
