# Maintainer:

# packaging options, convert to lowercase
_reduce_size=$( printf '%s' "$_reduce_size" | sed -e 's/^\(.*\)$/\L\1/' )
_autoupdate=$( printf '%s' "$_autoupdate" | sed -e 's/^\(.*\)$/\L\1/' )

# update version
case "$_autoupdate" in
  'true'|'t'|'yes'|'y'|'1'|'')
    _get() {
      curl https://api.github.com/repos/PCSX2/pcsx2/tags -s \
        | awk -F '"' '/"'"$1"'":/{print $4}' \
        | head -1 | sed 's/^v//'
    }
    _pkgver=$(_get name)
    ;;
  *)
    _pkgver=1.7.4632
esac
_appimage="pcsx2-v$_pkgver-linux-AppImage-64bit-Qt.AppImage"

_pkgname='pcsx2'
pkgname="$_pkgname-latest-bin"
pkgver=1.7.4632
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
# https://www.pcsx2.net
url='https://github.com/PCSX2/pcsx2'
license=(
  'GPL3'
  'LGPL3'
)
options=(!strip !debug)

depends=()
makedepends=()

provides=("$_pkgname")
conflicts=(${provides[@]})
replaces=('pcsx2-bin')

source=(
  "$url/releases/download/v$_pkgver/$_appimage"
  'rm_libs'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  case "$_reduce_size" in
  'true'|'t'|'yes'|'y'|'1')
      printf "%s.%s" \
        "$_pkgver" \
        "small"
      ;;
    *)
      printf "%s" \
        "$_pkgver"
      ;;
  esac
}

build() {
  # extract appimage
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # update script
  sed -Ei 's@APPDIR=\$\(dirname "\$0"\)@APPDIR=/opt/pcsx2@' "$srcdir/squashfs-root/AppRun"
}

package() {
  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/squashfs-root/PCSX2.desktop"

  install -Dm644 -t "$pkgdir/usr/share/pixmaps" "$srcdir/squashfs-root/PCSX2.png"

  mkdir -p "$pkgdir/opt"
  mv "$srcdir/squashfs-root" "$pkgdir/opt/pcsx2"

  # reduce size
  if [ "$_reduce_size" == "true" ] ; then
    xargs -i rm -rf "$pkgdir/opt/pcsx2/usr/lib/{}" < rm_libs
    hardlink -fmp "$pkgdir"
  fi
}
