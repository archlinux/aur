# Maintainer: Yifei Wu <kqwyfg@gmail.com>

pkgname=musiclake-git
_pkgname=musiclake
pkgver=224.38d4ca5
pkgrel=1
pkgdesc="A cross-platform music player based on electron, with access to Netease Music, QQ Music and Xiami Music."
arch=('x86_64')
url="https://github.com/sunzongzheng/music"
license=('GPL3')
depends=()
makedepends=('python2' 'git' 'npm' 'jq')
provides=('musiclake')
conflicts=('musiclake')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=("$_pkgname::git://github.com/sunzongzheng/music.git")
sha256sums=("SKIP")
_filename=player-1.2.0-linux.AppImage

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    < package.json jq 'del(.build.dmg)' | jq 'del(.build.mac)' | jq 'del(.build.win)' | jq 'del(.build.nsis)' | jq '.build.linux.target = ["AppImage"]' > package.json.new && mv package.json.new package.json # modify package.json to generate AppImage binary only
    npm install
    npm audit fix
    npm run build
    chmod +x releases/$_filename
}

package() {
    # extract icons
    mkdir -p squashfs-root/usr/share/icons/hicolor/{32x32,128x128,256x256}/apps
    $_pkgname/releases/$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/MusicLake.png" > /dev/null 2>&1

    # extract .desktop file
    $_pkgname/releases/$_filename --appimage-extract MusicLake.desktop > /dev/null 2>&1
    sed -i "s/Exec=AppRun/Exec=\/opt\/$_pkgname\/$_pkgname-$pkgver-linux.AppImage/" squashfs-root/MusicLake.desktop

    # install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
    chmod -R 755 "$pkgdir/usr/share/icons"
    find "$pkgdir/usr/share/icons" -type f -name "MusicLake.png" -exec chmod 644 {} \;

    # install .desktop file
    install -Dm644 "squashfs-root/MusicLake.desktop" "$pkgdir/usr/share/applications/MusicLake.desktop"

    # install .AppImage file
    install -Dm755 "$_pkgname/releases/$_filename" "$pkgdir/opt/$_pkgname/$_pkgname-$pkgver-linux.AppImage"
}
