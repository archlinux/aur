# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jacob Mischka <jacob@mischka.me>
# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
# Maintainer: whezzel <whezzel at gmail dot com>

pkgname=brave-beta-bin
pkgver=0.60.26
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
sha512sums=('02c2f323c5e51809af19ab9d0e1ce8f9f9b601792736260cd635f3af06263d45f9d5c6012baa3b70ea79e1ab21be3339dc0f104371bde290eab95feadd2517f7'
            'ac93a03ea03f759229c5066691648d2f480431a00350442492c2b53d19e11d0bd0cecf9c63b39c0e1feeb7b71718d619a63911eaec1aacc500cc553622206269'
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
