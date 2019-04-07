# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=majsoul-plus-bin
pkgver=1.12.0b3
_pkgver=${pkgver/b/-beta.}
pkgrel=1
pkgdesc="Majsoul browser (Binary)"
arch=('i686' 'x86_64')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss'
         'minizip' 'nss' 'snappy')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
provides=("majsoul-plus")
conflicts=("majsoul-plus")
source=("https://github.com/MajsoulPlus/majsoul-plus/raw/master/bin/icons/icon.png")
source_x86_64=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$_pkgver/Majsoul_Plus-linux-x64.zip"
)
source_i686=(
	"$pkgname-$pkgver-i686.zip::https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$_pkgver/Majsoul_Plus-linux-ia32.zip"
)
sha256sums=('be6005b9ae4238d53fcd9fe728a4985502c660adb670d3047b17da4a35f6fe31')
sha256sums_i686=('b99633465af425362f04f504f062f6854035a697098fca5fb9a3200a111bb9cb')
sha256sums_x86_64=('137ac7f10c4449ca7ee9e48a3abadd007998dab50d399a5f5d216f62ceb90cd5')

package() {
	targetarch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetarch="ia32"
	fi
	cd "Majsoul_Plus-linux-$targetarch"
	mkdir -p "$pkgdir/opt/majsoul-plus"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	find ./* -type f -exec install -Dm644 {} "$pkgdir/opt/majsoul-plus/{}" \;
	chmod +x "$pkgdir/opt/majsoul-plus/Majsoul_Plus"
	ln -s /opt/majsoul-plus/Majsoul_Plus "$pkgdir/usr/bin/majsoul-plus"

	for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert "$srcdir/icon.png" -resize ${size}x${size} "$target/majsoul-plus.png"
    done

	echo "[Desktop Entry]
Name=Majsoul Plus
Name[zh_CN]=雀魂 Plus
GenericName[zh_CN]=雀魂 Plus
Comment=Majsoul Plus Browser
Comment[zh_CN]=一款设计用于雀魂麻将的 PC 专用浏览器
Exec=/opt/majsoul-plus/Majsoul_Plus
Terminal=false
Type=Application
Icon=majsoul-plus
Categories=Game;" > "$srcdir/majsoul-plus.desktop"
	install -Dm644 "$srcdir/majsoul-plus.desktop" "$pkgdir/usr/share/applications/majsoul-plus.desktop"
}
