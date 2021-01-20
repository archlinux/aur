# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: SiHuan <sihuan at sakuya.love>
pkgname=majsoul-plus-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Majsoul browser (Binary)"
arch=('i686' 'x86_64')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('imagemagick')
provides=("majsoul-plus")
conflicts=("majsoul-plus")
source=("https://raw.githubusercontent.com/MajsoulPlus/majsoul-plus/master/assets/bin/icons/icon.png")
source_x86_64=(
	"$pkgname-$pkgver-x86_64.tar.gz::https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$pkgver/Majsoul_Plus-$pkgver-linux-x64.tar.gz"
)
source_i686=(
	"$pkgname-$pkgver-i686.tar.gz::https://github.com/MajsoulPlus/majsoul-plus/releases/download/v$pkgver/Majsoul_Plus-$pkgver-linux-ia32.tar.gz"
)
sha256sums=('be6005b9ae4238d53fcd9fe728a4985502c660adb670d3047b17da4a35f6fe31')
sha256sums_i686=('61010c8886fe717942a53fa2bb4f1e6ce4ad56974a122c4a9d32c25861f340d8')
sha256sums_x86_64=('364b825025933a8792465ab6e708af091dbb24cd54f8da78877367d59d9ab1ac')

package() {
	targetarch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetarch="ia32"
	fi
	cd "Majsoul_Plus-$pkgver-linux-$targetarch"
	mkdir -p "$pkgdir/opt/majsoul-plus"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	find ./* -type f -exec install -Dm644 {} "$pkgdir/opt/majsoul-plus/{}" \;
	chmod +x "$pkgdir/opt/majsoul-plus/majsoul-plus"
	ln -s /opt/majsoul-plus/majsoul-plus "$pkgdir/usr/bin/majsoul-plus"

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
Exec=/opt/majsoul-plus/majsoul-plus
Terminal=false
Type=Application
Icon=majsoul-plus
Categories=Game;" > "$srcdir/majsoul-plus.desktop"
	install -Dm644 "$srcdir/majsoul-plus.desktop" "$pkgdir/usr/share/applications/majsoul-plus.desktop"
}
