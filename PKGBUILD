# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"

# to update manually:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/PabloMK7/citra/releases
#       3. copy release date to $pkgver
#       4. copy commit to $_commit
#pkgver=20240422
#_commit=a8e601a

# to update automatically:
#       1. run makepkg
#_url="$(curl -s "https://api.github.com/repos/PabloMK7/citra/releases/latest" | jq -r '.assets[].browser_download_url | select(test("citra-linux-appimage.*tar.gz"))')"
_url="$(curl -s "https://api.github.com/repos/PabloMK7/citra/releases/latest" | awk -F'"' '/browser_download_url.*citra-linux-appimage.*tar.gz/ {print $4}')"
_commit="$(echo $_url | awk -F '[-.]' '{print $6}')"
pkgver="$(echo $_url | awk -F '[-.]' '{print $5}')"

pkgrel=3
epoch=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://citra-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("citra")
conflicts=("citra-bin"
           "citra-git"
           "citra-canary-bin"
           "citra-canary-git"
           "citra-qt-git"
           "citra-qt-canary-bin"
           "citra-qt-bin")
replaces=("citra-bin"
          "citra-qt-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/PabloMK7/citra/releases/download/r$_commit/citra-linux-appimage-$pkgver-$_commit.tar.gz"
        "citra.desktop")
b2sums=('SKIP'
        '1c12c015380367b599cb56cabfdcf9065e2cbb04e3145d0dcfdfc5e2cb404926c2851e58383c930f569b67da8f89095164b7d1f482f39fb5e1f5a1c26e1853b0')
options=("!strip")

package(){
 cd "citra-linux-appimage-$pkgver-$_commit"
 install -D -m 755 "citra.AppImage"       "$pkgdir/usr/bin/citra"
 install -D -m 755 "citra-room.AppImage"  "$pkgdir/usr/bin/citra-room"
 install -D -m 755 "citra-qt.AppImage"    "$pkgdir/usr/bin/citra-qt"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/citra.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/citra.desktop" -t "$pkgdir/usr/share/applications"
}

