# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=3.77.21}

# update version
case "${_autoupdate::1}" in
  't'|'y'|'1')
    _dl_url="https://download.beeper.com/linux/appImage/x64"

    _filename=$(
      curl -v --no-progress-meter -r 0-1 "$_dl_url" 2>&1 >/dev/null \
        | grep content-disposition \
        | sed -E 's@^.*\bcontent-disposition:.*\bfilename="([^"]+)".*$@\1@'
    )

    _pkgver_new=$(
      printf '%s' "$_filename" \
        | sed -E 's@^beeper-([0-9]+\.[0-9]+\.[0-9]+).AppImage$@\1@'
    )

    # update _pkgver
    if [ x"$_pkgver" != x"$_pkgver_new" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"
    fi
    ;;
  *)
    # _pkgver set in env

    _filename="beeper-$_pkgver.AppImage"
    _dl_url="https://download.todesktop.com/2003241lzgn20jd/$_filename"
    ;;
esac

_pkgname='beeper'
pkgname="$_pkgname-latest-bin"
pkgver=3.77.21
pkgrel=1
pkgdesc="all your chats in one app"
arch=('x86_64')
url="https://beeper.com/"
license=('custom')

depends=(
  'hicolor-icon-theme'
)
makedepends=()

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

source=(
  "$_filename"::"$_dl_url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  printf '%s' "$_pkgver"
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
