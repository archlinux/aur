# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

pkgname=velocidrone
pkgver=1.11.0.299
pkgrel=1
pkgdesc="Velocidrone: Fast paced FPV drone racing action with multiplayer and offline modes!"
arch=('x86_64')
url="http://www.velocidrone.com/"
license=('proprietary')
makedepends=(wget unzip)
depends=(gcc-libs gtk2)
optdepends=(steam)
conflicts=()
_source_id="0B5ZmVufmkjnwQU5jTVZ4TFJIZGs"
source=(
	"file://velocidrone-$pkgver.zip.sha256"
	"file://velocidrone.desktop"
	"https://www.velocidrone.com/img/logo.png")
sha256sums=('ab5b2b30717ecd35219eac63cf9140bfe1e56b1da04cf7785ccb0f7dff4e6483'
            '66ab24798d6b40f2c69f42368b79205f1e39ace4d8880785bfeb47f7f20d98cb'
            'dca386606781e552fc310bf414a911b335bb8d48114091f337d02db46befdee1')
prepare() {
	wget "https://drive.google.com/uc?export=download&id=$_source_id" -O avcheck.html --save-cookie cookie.txt
	_confirm=$(grep -e "confirm=[^'\"&]\+" -o avcheck.html)
	wget -c "https://drive.google.com/uc?export=download&id=$_source_id&$_confirm" --load-cookie cookie.txt -O velocidrone-$pkgver.zip
	echo Checking downloaded file checksum
	sha256sum --strict -c velocidrone-$pkgver.zip.sha256
}
package() {
	mkdir -p "$pkgdir/opt/velocidrone/"
	unzip "$srcdir/velocidrone-$pkgver.zip" -d "$pkgdir/opt/velocidrone/"
	chmod ugo+x "$pkgdir/opt/velocidrone/velocidrone.x86_64"
	install -Dm644 "$srcdir/velocidrone.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm 644 "$srcdir/logo.png" "${pkgdir}/opt/velocidrone/icon.png"
}
