# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=asset-ripper
pkgver=1.3.5
pkgrel=1
pkgdesc='Tool for extracting assets from Unity serialized files and asset bundles.'
arch=('x86_64')
url='https://assetripper.github.io/AssetRipper/'
license=('GPL-3.0-only')
depends=('dbus' 'glibc' 'xdg-utils')
makedepends=('dotnet-sdk-bin')
optdepends=('firefox' 'chromium')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AssetRipper/AssetRipper/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('cc4d6f091321fd72fa3b62bc29fef9e4ee4562e35e654d1b4f7c80e75c17e0f4')

_srcdir="AssetRipper-$pkgver"
_exeName="AssetRipper.GUI.Free"

#prepare() {
 # cd "${_srcdir}/Source/AssetRipper.GUI.Free"
  #sed -i 's|<OptimizationPreference>Size</OptimizationPreference>|<OptimizationPreference>Speed</OptimizationPreference>|' 'AssetRipper.GUI.Free.csproj'
#}

build() {
  cd "${_srcdir}/Source/AssetRipper.GUI.Free"

  dotnet publish --self-contained -c Release -o "${srcdir}/build"
  #ls -lha "${srcdir}/build"
}

package() {
  install -D "${_srcdir}/Media/Images/LogoReimagined/LogoReimaginedTransparent.png" "$pkgdir/usr/share/icons/$pkgname.png"

  cd 'build'

  install -dm755 "$pkgdir/opt/${pkgname}"
	for _file in "$_exeName" 'libcapstone.so'; do
		install -Dm755 "$_file" -t "$pkgdir/opt/$pkgname"
	done

  install -Dm644 <(cat << EOF
[Desktop Entry]
Type=Application
Name=Asset Ripper
Exec=/usr/bin/${pkgname} --log=False
Comment=${pkgdesc}
Categories=Game;Development;
Icon=${pkgname}
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_exeName" "$pkgdir/usr/bin/$pkgname"
}

