# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_pkgname="asset-ripper"
_exeName="AssetRipper.GUI.Free"

pkgname=asset-ripper-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="GUI Application to work with engine assets, asset bundles, and serialized files"
arch=(x86_64 aarch64)
url="https://github.com/AssetRipper/AssetRipper"
depends=('gcc-libs' 'dbus' 'glibc' 'webkit2gtk-4.1')

source=("https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/LICENSE.md"
	"https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/Media/Images/LogoReimagined/LogoReimaginedTransparent.png")
source_x86_64=("$_pkgname-x86_64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_x64.zip")
source_aarch64=("$_pkgname-aarch64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_arm64.zip")

sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            '223a74636902eeed55ad13a44e7292ff9f532df24c706dd8d566b33d00246757')
sha256sums_x86_64=('adda8845182adcbcb6b48b80404c4fad589a03030089c1d4a89a5c93cac20bb3')
sha256sums_aarch64=('0b262e9faf5b5d18d4abe301b589e799ac6b904e8ea32f36ffff580a9717f881')

license=("GPL-3.0-only")
options=("!debug")
provides=($_pkgname)
conflicts=($_pkgname)

package() {
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"

	_install_file=("$_exeName" "crunch.dll" "crunchunity.dll" "libcapstone.so" "libTexture2DDecoderNative.so" "Photino.Native.so")
	for _file in *; do #${_install_file[@]}; do
		install -Dm755 "$_file" "$pkgdir/opt/$_pkgname/$_file"
	done

	#if test [ ! -f "/opt/$_pkgname/AssetRipper.log" ]; then
	#touch "AssetRipper.log"
	#install -Dm666 "AssetRipper.log" "$pkgdir/opt/$_pkgname/AssetRipper.log"
	#fi

	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -D LogoReimaginedTransparent.png "$pkgdir/usr/share/icons/$_pkgname.png"

	ln -s "/opt/$_pkgname/$_exeName" "$pkgdir/usr/bin/$_pkgname"

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=Asset Ripper
Exec=/usr/bin/$_pkgname --log=False
Icon=$_pkgname
Terminal=false
Type=Application
Comment=GUI asset ripper
Categories=Game;Development;
EOF
}
