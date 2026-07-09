# Maintainer: brave <aur-release@brave.com>

pkgname=brave-origin-bin
pkgver=1.92.139
pkgrel=1
epoch=1
pkgdesc='The minimalist browser from the makers of Brave (binary release).'
arch=(x86_64 aarch64)
url=https://brave.com/origin/download
license=('MPL2')
depends=(alsa-lib gtk3 libxss nss ttf-font)
optdepends=('cups: Printer support'
	'libgnome-keyring: Enable GNOME keyring support'
	'libnotify: Native notification support')
provides=("$pkgname" "${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=($pkgname.sh "${pkgname%-bin}.desktop")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-origin-${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-origin-${pkgver}-linux-arm64.zip")

noextract=("${pkgname}-${pkgver}-x86_64.zip" "${pkgname}-${pkgver}-aarch64.zip")
sha256sums=('5ff70ee473f35c2fc7642c422c8abe20aaac0d7cc30a3292744eb9fbeafba1bd'
            'c70bc71c696b6764247070375ae111bd76c8bad9c7bda4d46e03975b95571a8a')
sha256sums_x86_64=('132d5290c8c997526deef89962489ddde5703cf98dcc8733547cd9d5ab6ec8a7')
sha256sums_aarch64=('d1d6483f23b64e0e081be12026d4927d719d31c3941f61d747fcfb418e994e34')

prepare() {
	mkdir -p brave
	bsdtar -xf "$pkgname-$pkgver-$CARCH.zip" -C brave
	chmod +x brave/brave
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a brave "$pkgdir/opt/$pkgname"
	chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-bin}.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" brave/LICENSE
	pushd "$pkgdir/usr/"
	for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm0644 "$pkgdir/opt/$pkgname/product_logo_${size/x*/}.png" \
			"share/icons/hicolor/$size/apps/brave-origin.png"
	done
}
