# Contributer: Bruce Zhang
# This PKGBUILD is directly modified from aur/dingtalk
pkgname=lx-music
pkgver=1.8.2
pkgrel=1
pkgdesc='一个基于 electron 的音乐软件'
arch=('x86_64')
url='https://github.com/lyswhut/lx-music-desktop'
license=('Apache 2.0')
depends=('electron9')
makedepends=('jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lyswhut/lx-music-desktop/archive/v$pkgver.tar.gz")
sha256sums=('51c060b1a8ed9b6a135108e91f9574954fe4c539d5aa4e76ebdfd6a4ebcb60bc')

prepare() {
	cd "$srcdir/$pkgname-desktop-$pkgver"
    electronDist="\/usr\/lib\/electron9"
    electronVersion=$(tail -1 /usr/lib/electron9/version)
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
    jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
    jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
    npm install
}

build() {
    cd "$srcdir/$pkgname-desktop-$pkgver"
    npm run pack:dir
}

package() {
	cd "$srcdir/$pkgname-desktop-$pkgver/build/linux-unpacked"
    
    # Install app
    install -Dm644 resources/app.asar "$pkgdir/usr/share/lx-music/app.asar"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron9 /usr/share/lx-music/app.asar
    " > "$srcdir/lx-music.sh"
    install -Dm755 "$srcdir/lx-music.sh" "$pkgdir/usr/bin/lx-music"

    # Install desktop file
    echo "[Desktop Entry]
Name=lx music desktop
Name[zh_CN]=洛雪音乐助手
Comment=洛雪音乐助手，一个基于 electron 的音乐软件
Exec=/usr/bin/lx-music
Terminal=false
Type=Application
Icon=lx-music
StartupWMClass=lx-music-desktop
Categories=AudioVideo;Utility;
    " > "$srcdir/lx-music.desktop"
    install -Dm644 "$srcdir/lx-music.desktop" "$pkgdir/usr/share/applications/lx-music.desktop"

    # Install icons
    cd "$srcdir/$pkgname-desktop-$pkgver/resources/icons"
    install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/lx-music.png"

    # Install license
    cd "$srcdir/$pkgname-desktop-$pkgver"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/lx-music/LICENSE"
    cp -r "licenses" "$pkgdir/usr/share/licenses/lx-music/licenses"
}
