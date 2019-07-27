# Maintainer: Bruce Zhang
pkgname=electron-xiami
pkgver=2.0.1
pkgrel=1
pkgdesc='虾米音乐 & 虾米电台 - Linux & Mac | Xiami Player & Xiami Radio desktop for Linux & Mac supported by Electron'
arch=('x86_64' 'i686')
url='https://github.com/eNkru/electron-xiami'
license=('MIT')
provides=('xiami')
depends=('electron')
makedepends=('jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/eNkru/electron-xiami/archive/v$pkgver.tar.gz")
sha256sums=('e140af91922db712c72bdbb703d9e9db31168db93341b300580d9330d45317a5')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    electronDist="\/usr\/lib\/electron"
    electronVersion=$(tail -1 /usr/lib/electron/version)
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
    jq '.build.linux.target = ["dir"]' package.json | sponge package.json
    jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
    jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
    jq ".scripts[\"dist:linux\"] = \"electron-builder --linux dir\"" package.json | sponge package.json
    npm install
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm run dist:linux
}

package() {
	cd "$srcdir/$pkgname-$pkgver/dist/linux-unpacked/resources"
    # Install app
    install -Dm644 app.asar "$pkgdir/usr/share/electron-xiami/app.asar"
    install -Dm644 extraResources/pepperflash/libpepflashplayer.so "$pkgdir/usr/share/electron-xiami/extraResources/pepperflash/libpepflashplayer.so"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron /usr/share/electron-xiami/app.asar
    " > "$srcdir/electron-xiami.sh"
    install -Dm755 "$srcdir/electron-xiami.sh" "$pkgdir/usr/bin/electron-xiami"

    # Install desktop file
    echo "[Desktop Entry]
Name=Xiami Music
Comment=Xiami Electron desktop application
Exec=electron-xiami %U
Terminal=false
Type=Application
Icon=electron-xiami
StartupWMClass=xiami music
X-AppImage-Version=2.0.1
Categories=AudioVideo;Audio;
X-AppImage-BuildId=1O743LhrYz7kMPA43OEQzo4X6cF
    " > "$srcdir/electron-xiami.desktop"
    install -Dm644 "$srcdir/electron-xiami.desktop" "$pkgdir/usr/share/applications/electron-xiami.desktop"

    # Install icons
    cd "$srcdir/$pkgname-$pkgver/build/icons"
    for size in 12 16 32 48 64 128 256 512; do
        install -Dm644 "${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/electron-xiami.png"
    done
}
