# Maintainer: JandereDev <me@janderedev.xyz>
# Contributor: Paul Makles <paulmakles@gmail.com>
pkgname=revolt-desktop-adblock-git
pkgver=33.adff38a
pkgrel=1
pkgdesc="Fork of revolt-desktop-git with AdBlocker"
arch=("x86_64")
url="https://revolt.chat"
license=("AGPL3")
depends=("electron")
makedepends=("git" "npm")
provides=("${pkgname%-adblock-git}")
conflicts=("revolt-desktop-git")
source=("git+https://github.com/janderedev/revolt-desktop-adblock.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/revolt-desktop-adblock"
    echo "$(git rev-list HEAD --count).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/revolt-desktop-adblock"
    
    electronDist=/usr/lib/electron
    electronVer=$(electron --version | tail -c +2)

    sed -i '/		"electron": /d' ./package.json
    HOME="$srcdir/.electron-gyp" npm install --no-save --cache "${srcdir}/npm-cache"
	npm run build:bundle

    ./node_modules/.bin/electron-builder -l dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
	cd "$srcdir/revolt-desktop-adblock"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-adblock-git}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname%-adblock-git}/"
    
    install -Dm644 build/icons/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-adblock-git}.png"
    
    install -dm755 "${pkgdir}/usr/bin" "revolt-desktop"
    
    install -Dm755 "revolt-desktop.sh" "$pkgdir/usr/bin/${pkgname%-adblock-git}"
    install -Dm644 "revolt-desktop.desktop" -t "$pkgdir/usr/share/applications"
}
