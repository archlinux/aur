# Maintainer: Lea <me@janderedev.xyz>
# Contributor: Paul Makles <paulmakles@gmail.com>
pkgname=rolt-desktop-git
pkgver=1.0.6
pkgrel=1
epoch=1
pkgdesc="Fork of Revolt Desktop that points to rolt.chat. If in doubt use revolt-desktop-git instead."
arch=("x86_64")
url="https://revolt.chat"
license=("AGPL3")
depends=("electron17")
makedepends=("git" "npm" "nodejs")
conflicts=("${pkgname%-git}" "revolt-desktop" "revolt-desktop-git")
provides=("${pkgname%-git}")
source=("git+https://github.com/jan-software-foundation/rolt-desktop.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rolt-desktop"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/rolt-desktop"
    
    electronDist=/usr/lib/electron17
    electronVer=$(${electronDist}/electron --version | tail -c +2)

    sed -i '/		"electron": /d' ./package.json
    HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
	npm run build:bundle

    ./node_modules/.bin/electron-builder -l dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
	cd "$srcdir/rolt-desktop"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname%-git}/"
    
    install -Dm644 build/icons/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    
    install -dm755 "${pkgdir}/usr/bin" "revolt-desktop"
    
    install -Dm755 "revolt-desktop.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "revolt-desktop.desktop" -t "$pkgdir/usr/share/applications"
}
