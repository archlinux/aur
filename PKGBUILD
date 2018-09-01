# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=brave
pkgver=0.23.105
pkgrel=2
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('x86_64')
url='https://www.brave.com'
license=('custom')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
makedepends=('npm' 'python2')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=('brave-browser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brave/browser-laptop/archive/v${pkgver}dev.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('30e11974d15df5a2c3b30f373542f214ac9f4c3ddbeed667a46036149f9f88828ab32fe98fcd3d37ad6d68fba379d1b69d6f1649f2f54836a1accc17199efceb'
            '985bc2ad94c20e9cc34bb65bc18d56d21f44e1df184a832c809dedb1814919b6396b85488a8cbe29bd312ef6d3553a96c13a59e34ca34a079686a25163d565e8'
            '400d345271a3c98be668e4aa08743d707647c92ee35951e937238ac07074119cfdb9601e1934cdf46014bd181b26ab0b568e4cab67c790efe53d029d8b0f9c55')

_bdir=brave-linux-x64
_edir="browser-laptop-${pkgver}dev"

build() {
    cd "$_edir"

    npm install

    # Workaround for https://github.com/brave/browser-laptop/issues/12667
    sed -i "s/require('git-rev-sync').long()/'${pkgver}dev'/" tools/buildPackage.js

    CHANNEL=dev npm run build-package
}

package() {
    cd "$_edir"

    install -dm0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto "$_bdir" "$pkgdir/usr/lib/$pkgname"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
    install -Dm0644 res/dev/app.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/MPL2"
    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname/"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
