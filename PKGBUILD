# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jacob Mischka <jacob@mischka.me>
# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
# Maintainer: whezzel <whezzel at gmail dot com>

pkgname=brave-beta-bin
pkgver=0.60.28
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (beta binary release).'
arch=('x86_64')
url='https://brave.com/download-beta'
license=('custom')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=("${pkgname}" 'brave-beta-browser')
conflicts=("${pkgname}" 'brave-bin' 'brave-dev-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        "$pkgname-$pkgver.deb::https://github.com/brave/brave-browser/releases/download/v$pkgver/brave-browser-beta_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/brave/brave-browser/master/LICENSE"
        "$pkgname.sh::https://raw.githubusercontent.com/whezzel/$pkgname/master/$pkgname.sh"
        "$pkgname.desktop::https://raw.githubusercontent.com/whezzel/$pkgname/master/$pkgname.desktop"
        "braveAbout.png::https://raw.githubusercontent.com/whezzel/$pkgname/master/braveAbout.png")
options=(!strip)
sha512sums=('04ef5019fcf8154c9da3b71fdb7ee975d8a6b64c6aedcfc6be2cfa143dbfcd49f31005ea876c7cc40743c0e8890fe452a9b0e14c2bccf4498e88f4f39172f6d5'
            '8bd0d97bd3c6a459e9d0c3113480f5df0b198c404a5692731836b6b8670ab6b0e492cd5bee51eaea6311ea0bbf21eb576963c69d43856dadfff23272da18ce10'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '24a49c1aa6f11fa090e870d75757e0b6e00f5b763d0bc84114c07285a1a8e973e4e40fe347f0fec3c00412197e36c6192d884270e3ee7ba636d8c3bb8d6dead4'
            '44809972e3980856494659b15d033b02c63dd1743293dc079d90d022904160532bbf82e70686dea20a46431981bf147cc5392ecc483c61378908b4a92a3d7515'
            'd7bef52e336bd908d24bf3a084a1fc480831d27a3c80af4c31872465b6a0ce39bdf298e620ae9865526c974465807559cc75610b835e60b4358f65a8a8ff159e')
noextract=("$pkgname-$pkgver.zip"
           "$pkgname-$pkgver.deb")

prepare() {
  mkdir -p brave
  cat $pkgname-$pkgver.zip | bsdtar -xf- -C brave
  chmod +x brave/brave
  mkdir -p brave-deb/data
  cat $pkgname-$pkgver.deb | bsdtar -xf- -C brave-deb
  cat brave-deb/data.tar.xz | bsdtar -xf- -C brave-deb/data
  cp -a --reflink=auto $srcdir/brave-deb/data/opt/brave.com/brave-beta/resources $srcdir/brave/resources
}

_bsdtardir="brave"

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto $_bsdtardir "$pkgdir/usr/lib/$pkgname"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-beta"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "braveAbout.png" "$pkgdir/usr/share/pixmaps/brave-beta.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
