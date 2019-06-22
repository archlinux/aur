# Maintainer: Bruce Zhang
pkgname=dingtalk
pkgver=2.1.0
pkgrel=1
pkgdesc='钉钉桌面版，基于electron和钉钉网页版开发，支持Windows、Linux和macOS'
arch=('x86_64' 'i686')
url='https://github.com/nashaofu/dingtalk'
license=('MIT')
provides=('dingtalk')
conflicts=('dingtalk-electron' 'dingtalk-git')
depends=('electron')
makedepends=('jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/nashaofu/dingtalk/archive/v$pkgver.tar.gz")
sha256sums=('cbe01b4aef5bef399fdcde9343e5bbe3bc7e767f36a9999f217b033c74ef85dc')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    electronDist="\/usr\/lib\/electron"
    electronVersion=$(tail -1 /usr/lib/electron/version)
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
    jq '.build.linux.target = ["dir"]' package.json | sponge package.json
    jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
    jq ".build.electronVersion = \"$electronDist\"" package.json | sponge package.json
    npm install
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm run build
    node_modules/.bin/electron-builder --linux
}

package() {
	cd "$srcdir/$pkgname-$pkgver/release/linux-unpacked"
    
    # Install app
    install -Dm644 resources/app.asar "$pkgdir/usr/share/dingtalk/app.asar"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron /usr/share/dingtalk/app.asar
    " > "$srcdir/dingtalk.sh"
    install -Dm755 "$srcdir/dingtalk.sh" "$pkgdir/usr/bin/dingtalk"

    # Install desktop file
    echo "[Desktop Entry]
Name=钉钉
Comment=钉钉桌面版，基于electron和钉钉网页版开发，支持Windows、Linux和macOS
Exec=/usr/bin/dingtalk
Terminal=false
Type=Application
Icon=dingtalk
StartupWMClass=钉钉
Categories=InstantMessaging;Network;
    " > "$srcdir/dingtalk.desktop"
    install -Dm644 "$srcdir/dingtalk.desktop" "$pkgdir/usr/share/applications/dingtalk.desktop"

    # Install icons
    cd "$srcdir/$pkgname-$pkgver/resources/icons"
    for size in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dingtalk.png"
    done
}
