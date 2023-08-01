# Maintainer: DanielNak <daniel@tee.cat>

_filename=Truple.AppImage
_pkgname='truple'
pkgname="$_pkgname-latest-bin"
pkgver=1.10.4
pkgrel=1
pkgdesc="Truple Screenshot Accountability holds you accountable for how you use your Linux machine by randomly capturing and sharing screenshots with a trusted friend or loved one of your choosing."
arch=('x86_64')
url="https://truple.io/"
license=('custom')
depends=(
  'hicolor-icon-theme'
)
makedepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=(
  "$_filename"::"https://linux.truple.io/prod/Truple.AppImage"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir"

  # extract appimage
  chmod +x "$_filename"
  "$srcdir/$_filename" --appimage-extract truple.desktop > /dev/null

  cat squashfs-root/truple.desktop | grep Version | cut -d= -f2
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
    's@^(if \[ -z \"\$APPDIR\" ] ; then)$@APPDIR="/opt/truple"\n\1@' \
    "$srcdir/squashfs-root/AppRun"

  # fix desktop file
  sed -Ei \
    's@^Exec=AppRun (.*)$@Exec=truple \1@' \
    "$srcdir/squashfs-root/truple.desktop"
}

package() {
  # apprun script
  install -vDm0755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/truple"

  # desktop file
  install -vDm0644 "$srcdir/squashfs-root/truple.desktop" "$pkgdir/usr/share/applications/truple.desktop"

  # icons
  install -vDm0644 "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/truple.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  # license files
  install -vDm0644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -vDm0644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$_pkgname"

  # everything else
  mkdir -p "$pkgdir/opt"
  mv "$srcdir/squashfs-root" "$pkgdir/opt/truple"
}
