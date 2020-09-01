# Contributor: Greg White <gwhite@kupulaucom>
# Maintainer: Greg White <gwhite@kupulaucom>

pkgname=brave-dev-bin
pkgver=1.14.71
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (dev binary release).'
chrome_version=86.0.4229.0
arch=('x86_64')
url='https://brave.com/download-dev'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
	    'libgnome-keyring: gnome keyring support')
provides=("${pkgname}" 'brave-dev-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png"
        "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-unstable/google-chrome-unstable_${chrome_version}-1_amd64.deb")
options=(!strip)
sha512sums=('d1fbd52b6f73546b666deb45bec2c7e32e1d56bcef29c7c3f7b6b7f0cf09de78e37d659b8d3c54e76307f20ce14a535526bcffae14e947ecb13b220e5dcbe199'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            'daa7a78c2efd8a3c4e0c262cace76e915a31991bb6438f5dd9bee6bf6a6309a28ee76ddc054609a792d18ed561e2824b377df9db0eb56bbb391c469cb8a86f6c'
            'b71da6c9d587294a015fdb417e3483bcad768be9c82224051980621963ddc314a235208dab1c4d3e71a8894972d1cf2f86f598d4b9953d8a9e85406066d75caa'
            '5caba107bd958a4387b35f144d695c4f63e9c1bb874c906a1d141efba403d2e2c4b30d756630afc2567089fdbfef7abadba6fa5becf63cffa6dce16bfd50cd47'
            'b97916505a0eecd5781f687090a6bb1896e7119f91406a29b551bc4ed0692b39767a5f6550c4c24a6ac52df3de5ef5e4eb05a6c01a09a8b86d609279ed7e9423')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  mkdir -p brave
  ar xv google-chrome-unstable_86.0.4229.0-1_amd64.deb data.tar.xz
  xz -fd data.tar.xz
  tar xvf data.tar "./opt/google/chrome-unstable/libEGL.so" "./opt/google/chrome-unstable/libGLESv2.so"
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
    install -Dm0755 "./opt/google/chrome-unstable/libEGL.so" "$pkgdir/usr/lib/brave-dev-bin/libEGL.so"
    install -Dm0755 "./opt/google/chrome-unstable/libGLESv2.so" "$pkgdir/usr/lib/brave-dev-bin/libGLESv2.so"
}
