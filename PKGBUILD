# Maintainer: acutenoob <handsome23388@outlook.com>

_pkgname="bilibili-live-stream-code"
pkgname="$_pkgname-git"
pkgver=2.3.12.1.g8b28d31
pkgrel=1
pkgdesc="用于在准备直播时获取第三方推流码"
url="https://github.com/ChaceQC/bilibili_live_stream_code"
license=('Apache-2.0 ')
arch=('any')

makedepends=(
  "npm"
  "python"
  "imagemagick"
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/ChaceQC/bilibili_live_stream_code.git"
)
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgsrc"
  git describe --tags --abbrev=7 | sed -E 's/^[^0-9]*//; s/-([0-9]+)-g/.\1.g/; s/-/./g'
}
prepare() {
  cd "$_pkgsrc"
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  pip install pyinstaller
  cd frontend
  npm install
}

build() {
  cd "$_pkgsrc"
  cd frontend
  npm run build
  cd ..
  pyinstaller main.py --name BiliLiveTool --onefile \
  --add-data "frontend/dist:frontend/dist" \
  --add-data "bilibili.ico:." \
  --hidden-import _cffi_backend \
  --hidden-import cffi \
  --hidden-import qtpy \
  --hidden-import PyQt5 \
  --hidden-import webview.platforms.qt
}

package() {
  cd $_pkgsrc
  install -Dm755 "dist/BiliLiveTool" "$pkgdir/usr/bin/$_pkgname"

  for size in 48 128 256; do
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "bilibili.ico" -resize ${size}x${size} "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=$_pkgname
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Utility;
Terminal=false
END
}
