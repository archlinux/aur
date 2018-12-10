# Contributor: Greg White <gwhite@kupulaucom>
# Maintainer: Greg White <gwhite@kupulaucom>

pkgname=brave-dev-bin
pkgver=0.59.2
pkgrel=16
pkgdesc='Web browser that blocks ads and trackers by default (dev binary release).'
arch=('x86_64')
url='https://brave.com/download-dev'
license=('custom')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=("${pkgname}" 'brave-dev-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png")
options=(!strip)
sha512sums=('efbf3be7b267911d9e9b14aec3b364e3021c7d5a0ee00d3185ad9f3c9d57bf59f048e29c525bb3a3f0a04d81d46e5450d8584cf5d354360419c38f7bdb42678e'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            'f787dd9d80d3fa482fe8450da16645046c71a4684b80f7e97a3cc62e0792959ede1b926894df227174af2fb76730a3c529b16ffdb66a499fc3148a334fb06057'
            'b71da6c9d587294a015fdb417e3483bcad768be9c82224051980621963ddc314a235208dab1c4d3e71a8894972d1cf2f86f598d4b9953d8a9e85406066d75caa'
            'd7bef52e336bd908d24bf3a084a1fc480831d27a3c80af4c31872465b6a0ce39bdf298e620ae9865526c974465807559cc75610b835e60b4358f65a8a8ff159e')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  mkdir -p brave
  cat $pkgname-$pkgver.zip | bsdtar -xf- -C brave
  chmod +x brave/brave
}

_bsdtardir="brave"

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto $_bsdtardir "$pkgdir/usr/lib/$pkgname"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-dev"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "braveAbout.png" "$pkgdir/usr/share/pixmaps/brave-dev.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
