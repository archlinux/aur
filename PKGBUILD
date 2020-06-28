# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Yesterday17 <t@yesterday17.cn>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=majsoul-plus-beta-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Majsoul browser (beta versions)"
arch=('i686' 'x86_64')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss'
         'minizip' 'nss' 'snappy' 'gconf')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
provides=("majsoul-plus-beta")
conflicts=("majsoul-plus-beta")
source=("https://github.com/MajsoulPlus/majsoul-plus/raw/master/assets/bin/icons/icon.png")
source_x86_64=("https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$pkgver/Majsoul_Plus-$pkgver-linux-x64.tar.gz")
source_i686=("https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$pkgver/Majsoul_Plus-$pkgver-linux-ia32.tar.gz")
sha256sums=('be6005b9ae4238d53fcd9fe728a4985502c660adb670d3047b17da4a35f6fe31')
sha256sums_i686=('61010c8886fe717942a53fa2bb4f1e6ce4ad56974a122c4a9d32c25861f340d8')
sha256sums_x86_64=('364b825025933a8792465ab6e708af091dbb24cd54f8da78877367d59d9ab1ac')

package() {
	targetarch=""
	if [ "$CARCH" == "i686" ]; then
		targetarch="-ia32"
	else
		targetarch="-x64"
	fi
	cd "Majsoul_Plus-$pkgver-linux$targetarch"
	mkdir -p "$pkgdir/opt/majsoul-plus-beta"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	find ./* -type f -exec install -Dm644 {} "$pkgdir/opt/majsoul-plus-beta/{}" \;
	chmod +x "$pkgdir/opt/majsoul-plus-beta/majsoul-plus"
	ln -s /opt/majsoul-plus-beta/majsoul-plus "$pkgdir/usr/bin/majsoul-plus"

	for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert "$srcdir/icon.png" -resize ${size}x${size} "$target/majsoul-plus-beta.png"
    done

	echo "[Desktop Entry]
Name=Majsoul Plus (Beta)
Name[zh_CN]=雀魂 Plus 2 (测试版)
GenericName[zh_CN]=雀魂 Plus 2 (测试版)
Comment=Majsoul Plus Browser
Comment[zh_CN]=一款设计用于雀魂麻将的 PC 专用浏览器
Exec=/opt/majsoul-plus-beta/majsoul-plus
Terminal=false
Type=Application
Icon=majsoul-plus-beta
Categories=Game;" > "$srcdir/majsoul-plus-beta.desktop"
	install -Dm644 "$srcdir/majsoul-plus-beta.desktop" "$pkgdir/usr/share/applications/majsoul-plus-beta.desktop"
}
