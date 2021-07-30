# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andrés Rodríguez <hello@andres.codes>
# Contributor: Jacob Mischka <jacob@mischka.me>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: Simón Oroño <simonorono@protonmail.com>
# Contributor: now-im <now im 627 @ gmail . com>
# Contributor: Giusy Digital <kurmikon at libero dot it>

# Version notes:
# `curl https://brave-browser-downloads.s3.brave.com/latest/release.version`
#
# 1.27.108 known broken on Linux

pkgname=brave-bin
pkgver=1.26.77
pkgrel=3
epoch=1
pkgdesc='Web browser that blocks ads and trackers by default (binary release)'
arch=(x86_64)
url='https://brave.com'
license=(MPL2 BSD custom:chromium)
depends=(alsa-lib
         gtk3
         libxss
         nss
         ttf-font)
optdepends=('cups: Printer support'
            'libgnome-keyring: Enable GNOME keyring support'
            'libnotify: Native notification support')
provides=("${pkgname%-bin}=$pkgver" 'brave-browser')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://github.com/brave/brave-browser/releases/download/v$pkgver/brave-browser-$pkgver-linux-amd64.zip"
        "$pkgname.sh"
        'brave-browser.desktop')
noextract=("$pkgname-$pkgver.zip")
sha256sums=('75af7ea3438ac80fee18372798d2c689384d8f1bc2f1dead5470047931f5b43c'
            'ba7d57a3328c68e6a78e49506af0e238936e823b2f463e8087c20fcf4300232a'
            'c07276b69c7304981525ecb022f92daf7ae125a4fb05ac3442157b50826e257a')

prepare() {
	mkdir -p brave
	bsdtar -xf "$pkgname-$pkgver.zip" -C brave
	chmod +x brave/brave
}

package() {
	install -dm0755 "$pkgdir/usr/lib"
	cp -a brave "$pkgdir/usr/lib/$pkgname"

	# allow firejail users to get the suid sandbox working
	chmod 4755 "$pkgdir/usr/lib/brave-bin/chrome-sandbox"

	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "brave-browser.desktop"
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir/usr/lib/$pkgname/product_logo_${i/x*/}.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/brave-desktop.png"
	done
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" brave/LICENSE
	rm "$pkgdir/usr/lib/$pkgname/LICENSE"
}
