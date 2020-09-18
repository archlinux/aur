# Contributor: Greg White <gwhite@kupulaucom>
# Maintainer: Greg White <gwhite@kupulaucom>

pkgname=brave-dev-bin
pkgver=1.15.56
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (dev binary release).'
chrome_version=86.0.4240.22
arch=('x86_64')
url='https://brave.com/download-dev'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
	    'libgnome-keyring: gnome keyring support'
	    'mesa: Hardware accelerated rendering'
	    'libglvnd: Support multiple different OpenGL drivers at any given time')
provides=("${pkgname}" 'brave-dev-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png")
options=(!strip)
sha512sums=('e21868ee9530d11c89d1fb3b9f6bb3c7deafd2eb9886f1a3ab763ef0912dec571dbd904724f77becdaecfcca5cbef12c462d24792c24067e42e197a99070018b'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '128ceca4c95aa9beb9f6b6b7da3fbc01d01f24d61de0e3fc07297c53f90dd117300f31d4e1d1dfab471b121d31222f01390540d75c4529b99b9b9a2ee7192a1a'
            'b71da6c9d587294a015fdb417e3483bcad768be9c82224051980621963ddc314a235208dab1c4d3e71a8894972d1cf2f86f598d4b9953d8a9e85406066d75caa'
            '5caba107bd958a4387b35f144d695c4f63e9c1bb874c906a1d141efba403d2e2c4b30d756630afc2567089fdbfef7abadba6fa5becf63cffa6dce16bfd50cd47')
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
#    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
