# Maintainer:

# packaging options
_reduce_size="false" # remove unneeded files
_autoupdate="true"

# update version
if [ x"$_autoupdate" == "xtrue" ] ; then
  _get() {
    curl https://api.github.com/repos/PCSX2/pcsx2/tags -s \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | head -1 | sed 's/^v//'
  }
  _pkgver=$(_get name)
else
  _pkgver=1.7.4545
fi
_appimage="pcsx2-v$_pkgver-linux-AppImage-64bit-Qt.AppImage"

_pkgname='pcsx2'
pkgname="$_pkgname-bin"
pkgver=1.7.4545
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

provides=(
  'pcsx2'
  'pcsx2-git'
  'pcsx2-qt'
)
conflicts=(${provides[@]})

source=(
  "$url/releases/download/v$_pkgver/$_appimage"
  'rm_libs'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  if [ "$_reduce_size" == "true" ] ; then
    printf "%s.%s" \
      "$_pkgver" \
      "small"
  else
    printf "%s" \
      "$_pkgver"
  fi
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
