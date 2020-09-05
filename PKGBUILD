# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.15.37
pkgrel=1
chrome_version=86.0.4240.22
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
    	    'mesa: Hardware accelerated rendering'
	        'libglvnd: Support multiple different OpenGL drivers at any given time')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-v${pkgver}-linux-x64.zip"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png")
options=(!strip)
sha512sums=('edbc5c8b9339868c082ac1b651a63ec8e102e90e69f125452c0a661b9966e53def99614281f52ab4b3466b93034b883feb3a1c67f04c4e0d85675aac7953d406'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '853c1715320615f7cfe39f07af07572c09265d32a3cde97309cffe0be6520f2aa405602fa51e3f497724ecaf96c68985e2babb593748e5d405f2b309bf1bcf33'
            '86cf37b0dc8b37390da9341200af511721c8d2d81ccd45f565322271654058cf47680ae263cf5339feddd42d16bfce7f0aa824f2a45a7c446ed81fe6f749bb92'
            'd5ce90529c2b75357518ebde10e28e9d6f36efe21b705d7e48be07b1f320d739ef211c1bcc353aeefab3f27b7ba78793ebb74a204ac6c8efae855001b80de72a')
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

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-nightly"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "braveAbout.png" "$pkgdir/usr/share/pixmaps/brave-nightly.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
}
