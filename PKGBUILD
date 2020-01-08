# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=phoenix
_pkgver=1.0.0-beta.12
pkgver=1.0.0.beta.12
pkgrel=1
pkgdesc='The BurstCoin desktop wallet'
arch=(x86_64)
url="https://github.com/burst-apps-team/phoenix"
license=(GPL3)
depends=(nodejs)
makedepends=(npm angular-cli)
install=phoenix.install
source=(https://github.com/burst-apps-team/$pkgname/archive/desktop-${_pkgver}.zip
        $pkgname.desktop
        electron-builder.json.patch)
sha256sums=('5a9b8d0ce1bf5226f9ba3d94bba0b518cc22e536c690a2d8346bb06c6e951196'
            'ee7cb123dca7e311bea596df59d59284a9b0b32be6990da3cd89303a800acac0'
            'a89ebcaa537d3456ad49c5ab8157fb88d649e2aa3e5791b9217b2d0f95f838de')

build() {
    cd "$srcdir/$pkgname-desktop-${_pkgver}/lib"
    npm install
    npm run bootstrap
    cd ../web/angular-wallet
    npm install
    cd ../../scripts
    npm install
    cd ../desktop/wallet
    npm install
    # patch build only unpacked
    patch electron-builder.json < "$srcdir/electron-builder.json.patch"

    npm run release:linux
}

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/$pkgname-desktop-${_pkgver}/desktop/wallet/release-builds/linux-unpacked/." "$pkgdir/opt/$pkgname"

    # https://github.com/electron/electron/issues/17972
    cd "$pkgdir/opt/$pkgname"
    chmod 4755 ./chrome-sandbox
    chown root:root ./chrome-sandbox

    # Menu entry
    install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname-desktop-${_pkgver}/assets/phoenix.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
