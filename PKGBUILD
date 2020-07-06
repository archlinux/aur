# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=phoenix
pkgver=1.0.1
pkgrel=1
pkgdesc='Burstcoin desktop wallet'
arch=(x86_64)
url='https://github.com/burst-apps-team/phoenix'
license=(GPL3)
depends=(nodejs)
makedepends=(npm angular-cli)
install=phoenix.install
source=(https://github.com/burst-apps-team/phoenix/archive/desktop-$pkgver.zip
        phoenix.desktop
        electron-builder.json.patch)
sha256sums=('1e9faf706baec97903a342415de71f3ebe5f2d3c3ac52ee8580f9670ea46a15d'
            '1409c32674b62e20d04a61b7bddbc787c3027c32ee350f4909f0aa6117ae02b1'
            'a89ebcaa537d3456ad49c5ab8157fb88d649e2aa3e5791b9217b2d0f95f838de')

build() {
    cd $srcdir/$pkgname-desktop-$pkgver/lib
    npm install
    npm run bootstrap
    cd ../web/angular-wallet
    npm install
    cd ../../scripts
    npm install
    cd ../desktop/wallet
    npm install
    # patch build only unpacked
    patch electron-builder.json < $srcdir/electron-builder.json.patch

    npm run release:linux
}

package() {
    install -dm755 $pkgdir/opt/$pkgname
    cp -a $srcdir/$pkgname-desktop-$pkgver/desktop/wallet/release-builds/linux-unpacked/. $pkgdir/opt/$pkgname

    # https://github.com/electron/electron/issues/17972
    cd $pkgdir/opt/$pkgname
    chmod 4755 ./chrome-sandbox
    chown root:root ./chrome-sandbox

    # Menu entry
    install -Dm644 $srcdir/$pkgname.desktop -t $pkgdir/usr/share/applications
    install -Dm644 $srcdir/$pkgname-desktop-$pkgver/assets/phoenix.png $pkgdir/usr/share/pixmaps/$pkgname.png

    install -d $pkgdir/usr/bin
    ln -sf "/opt/phoenix/phoenix" "$pkgdir/usr/bin/phoenix"
}
