# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.14.34
pkgrel=12
chrome_pkgver=86.0.4229.0
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png"
        "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-unstable/google-chrome-unstable_${chrome_pkgver}-1_amd64.deb")
options=(!strip)
sha512sums=('4cb72ee3dd50e9ac0f8007128714f93412ea4a2c63128ac610c474c7f1f089eddbf4cbe46f95b6e209e7a1a259c6988e8ca8a6f82ceb86d292efca772eba0a2f'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            'e4f153529ad3dff82a7b08eba34857b3b81070a68f458a811a09695419cb513b82e6a3f0323cf3abedee126aff306ba23f703014bdfbd180f64373b84984e652'
            '86cf37b0dc8b37390da9341200af511721c8d2d81ccd45f565322271654058cf47680ae263cf5339feddd42d16bfce7f0aa824f2a45a7c446ed81fe6f749bb92'
            'd5ce90529c2b75357518ebde10e28e9d6f36efe21b705d7e48be07b1f320d739ef211c1bcc353aeefab3f27b7ba78793ebb74a204ac6c8efae855001b80de72a'
            'b97916505a0eecd5781f687090a6bb1896e7119f91406a29b551bc4ed0692b39767a5f6550c4c24a6ac52df3de5ef5e4eb05a6c01a09a8b86d609279ed7e9423')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  mkdir -p brave
  ar xv google-chrome-unstable_86.0.4229.0-1_amd64.deb data.tar.xz
  xz -d data.tar.xz
  tar xvf data.tar "./opt/google/chrome-unstable/libEGL.so" "./opt/google/chrome-unstable/libGLESv2.so"
  cat $pkgname-$pkgver.zip | bsdtar -xf- -C brave
  chmod +x brave/brave
}

_bsdtardir="brave"

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto $_bsdtardir "$pkgdir/usr/lib/$pkgname"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-nightly"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "braveAbout.png" "$pkgdir/usr/share/pixmaps/brave-nightly.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
    
    install -Dm0755 "./opt/google/chrome-unstable/libEGL.so" "$pkgdir/usr/lib/brave-nightly-bin/libEGL.so"
    install -Dm0755 "./opt/google/chrome-unstable/libGLESv2.so" "$pkgdir/usr/lib/brave-nightly-bin/libGLESv2.so"
}
