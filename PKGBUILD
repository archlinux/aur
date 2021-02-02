# Maintainer: BL4CKH47H4CK3R <BL4CKH47H4CK3R@ARCHLINUX.ORG>
# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>
# https://aur.archlinux.org/packages/brave/

pkgname=brave-browser-nightly
pkgver=1.21.39
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
	    	'libgnome-keyring: gnome keyriung support')
provides=("${pkgname%}" "brave")
conflicts=("brave-nightly-bin")
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly-${pkgver}-linux-amd64.zip"
        "$pkgname.sh"
        "brave-browser-nightly.png"
        "brave-browser-nightly.desktop")
options=(!strip)
sha512sums=('1cef93826626aa8ea0d0a6ee4b5cb9f514df446641e633124c80a9330c135b2cc16a55ddbe5276d28a2858fbc20cc47b4cd50c0219db831c02d1dd0178dfd851'
            '25f894ce7ce85fb71346eaa3756e1078bb3f8a35f078f2c512bfaeaf86c541136c34b32e81cfb783997fc6a261c258daab85db9df60479b456047108fa3f7e31'
            'd5ce90529c2b75357518ebde10e28e9d6f36efe21b705d7e48be07b1f320d739ef211c1bcc353aeefab3f27b7ba78793ebb74a204ac6c8efae855001b80de72a'
            'acf4f25ab54c346cfea9ca05e48308deb874728a8c2954d9b2f4239361d470ab0ad0cb98a177e3c33416785238b35c3ea3f230a4053c3d73f85fcdcc11432554')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  mkdir -p brave-browser-nightly
  bsdtar -xf $pkgname-$pkgver.zip -C brave-browser-nightly
  chmod +x brave-browser-nightly/brave
}

_srcdir="brave-browser-nightly"

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto $_srcdir "$pkgdir/usr/lib/$pkgname"

    # Allow Firejail Users To Get The SUID Sandbox Working
    chmod 4755 $pkgdir/usr/lib/$_srcdir/chrome-sandbox

	# Remove Unnecessary Brave Features
	rm -rf $pkgdir/usr/lib/$_srcdir/cron
	rm -rf $pkgdir/usr/lib/$_srcdir/resources/brave_rewards
	
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "brave-browser-nightly.desktop"
    install -Dm0644 "brave-browser-nightly.png" "$pkgdir/usr/share/pixmaps/brave-browser-nightly.png"
	LICENSES_DIR="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$LICENSES_DIR"
    if [ -f "$pkgdir/usr/lib/$pkgname/LICENSE" ] && [ -f "$pkgdir/usr/lib/$pkgname/LICENSES.chromium.html" ]; then
      mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$LICENSES_DIR"
    fi
}
