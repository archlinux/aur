# Maintainer: brave <aur-release@brave.com>

pkgname=brave-origin
pkgver=1.93.129
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
provides=("brave-origin" "${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=(brave-origin.sh "${pkgname%-bin}.desktop" 'translator')
source_x86_64=("brave-origin-${pkgver}-x86_64.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-origin-${pkgver}-linux-amd64.zip")
source_aarch64=("brave-origin-${pkgver}-aarch64.zip::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-origin-${pkgver}-linux-arm64.zip")

noextract=("brave-origin-${pkgver}-x86_64.zip" "brave-origin-${pkgver}-aarch64.zip")
sha256sums=('5ff70ee473f35c2fc7642c422c8abe20aaac0d7cc30a3292744eb9fbeafba1bd'
            'c70bc71c696b6764247070375ae111bd76c8bad9c7bda4d46e03975b95571a8a')
sha256sums_x86_64=('ad79b97d17838682f2495ae2d4ca25ec4708fb4fb1f112aa42715946156975c2')
sha256sums_aarch64=('a76c136473d63f2526dcfaef5d3ed89c786b7ae33aacf7684ca3602f9c50f99e')

prepare() {
	mkdir -p brave
	bsdtar -xf "brave-origin-$pkgver-$CARCH.zip" -C brave
	chmod +x brave/brave
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a brave "$pkgdir/opt/brave-origin"
	chmod 4755 "$pkgdir/opt/brave-origin/chrome-sandbox"
	install -Dm0755 "brave-origin.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-bin}.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/brave-origin/" brave/LICENSE
	pushd "$pkgdir/usr/"
	for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm0644 "$pkgdir/opt/brave-origin/product_logo_${size/x*/}.png" \
			"share/icons/hicolor/$size/apps/brave-origin.png"
	done
}

