# Maintainer:

_reduce_size="false"

_pkgname='pcsx2'
pkgname="$_pkgname-bin"
pkgver=1.7.4534
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
#url='https://www.pcsx2.net'
url='https://github.com/PCSX2/pcsx2'
license=(
  'GPL3'
  'LGPL3'
)
options=(!strip !debug)

depends=()
makedepends=(
  'jq'
)

provides=(
  'pcsx2'
  'pcsx2-git'
  'pcsx2-qt'
)
conflicts=(${provides[@]})

source=(
  'rm_libs'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  local _pkgver=$(curl --silent "https://api.github.com/repos/PCSX2/pcsx2/tags" | jq -r 'first | .name' | sed 's/^v//')

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
  cd "$srcdir"

  _appimage="pcsx2-v${pkgver%.[a-z]*}-linux-AppImage-64bit-Qt.AppImage"

  # find or download latest appimage
  if [ -f "$_appimage" ] ; then
    : # already exists, nothing to do
  elif [ -f "../$_appimage" ] ; then
    ln -sf "../$_appimage" ./
  else
    # note: download in build because prepare runs before pkgver
    curl -L -o "$_appimage" \
      "$url/releases/download/v${pkgver%.[a-z]*}/$_appimage"
  fi

  # extract appimage
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # update script
  sed -Ei 's@APPDIR=\$\(dirname "\$0"\)@APPDIR=/opt/pcsx2@' "$srcdir/squashfs-root/AppRun"
}

package() {
  cd "$srcdir"

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
