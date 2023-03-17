
_pkgname='pcsx2'
pkgname="$_pkgname-bin"
pkgver=1.7.4239
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
#url='https://www.pcsx2.net'
url='https://github.com/PCSX2/pcsx2'
license=(
  'GPL3'
  'LGPL3'
)

depends=()
makedepends=(
  'jq'
  'aria2'
)

provides=(
  'pcsx2'
  'pcsx2-git'
  'pcsx2-qt'
)
conflicts=(${provides[@]})

source=()
sha256sums=()

pkgver() {
  curl --silent "https://api.github.com/repos/PCSX2/pcsx2/tags" | jq -r 'first | .name' | sed 's/^v//'
}

build() {
  _appimage="pcsx2-v$pkgver-linux-AppImage-64bit-Qt.AppImage"

  # download latest appimage
  if [ -f "../$_appimage" ] ; then
    ln "../$_appimage" .
  else
    aria2c "$url/releases/download/v$pkgver/$_appimage"
  fi

  # extract appimage
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # update script
  sed -Ei 's@APPDIR=\$\(dirname "\$0"\)@APPDIR=/opt/pcsx2@' "$srcdir/squashfs-root/AppRun"
}

package() {
  depends+=(
  )

  cd "$srcdir"

  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/squashfs-root/PCSX2.desktop"

  install -Dm644 -t "$pkgdir/usr/share/pixmaps" "$srcdir/squashfs-root/PCSX2.png"

  mkdir -p "$pkgdir/opt"
  mv "$srcdir/squashfs-root" "$pkgdir/opt/pcsx2"
}
