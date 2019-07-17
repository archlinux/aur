 
# Maintainer: Yesterday17 <t@yesterday17.cn>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>
pkgname=majsoul-plus-beta-bin
pkgver=2.0.0.beta.1
_pkgver=2.0.0-beta.1
pkgrel=1
pkgdesc="[2.x] Majsoul browser (Binary)(beta)"
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
source_x86_64=(
	"https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$_pkgver/majsoul-plus-client-$_pkgver.tar.gz"
)
source_i686=(
	"https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$_pkgver/majsoul-plus-client-$_pkgver-ia32.tar.gz"
)
sha256sums=('be6005b9ae4238d53fcd9fe728a4985502c660adb670d3047b17da4a35f6fe31')
sha256sums_i686=('1695c18a7949ab0600056946c228af7fbaecbf5fa2aa947e238dfc0a96fdd6e1')
sha256sums_x86_64=('f463779ed1b4ffd13cd4cfe3b2515fe9a11aaa89d401dfed2ba93a1157aabe7b')

package() {
	targetarch=""
	if [ "$CARCH" == "i686" ]; then
		targetarch="-ia32"
	fi
	cd "majsoul-plus-client-$_pkgver$targetarch"
	mkdir -p "$pkgdir/opt/majsoul-plus-beta"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	find ./* -type f -exec install -Dm644 {} "$pkgdir/opt/majsoul-plus-beta/{}" \;
	chmod +x "$pkgdir/opt/majsoul-plus-beta/majsoul-plus-client"
	ln -s /opt/majsoul-plus-beta/majsoul-plus-client "$pkgdir/usr/bin/majsoul-plus-beta"

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
Exec=/opt/majsoul-plus-beta/majsoul-plus-client
Terminal=false
Type=Application
Icon=majsoul-plus-beta
Categories=Game;" > "$srcdir/majsoul-plus-beta.desktop"
	install -Dm644 "$srcdir/majsoul-plus-beta.desktop" "$pkgdir/usr/share/applications/majsoul-plus-beta.desktop"
}
