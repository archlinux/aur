# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=asset-ripper
pkgver=1.3.2
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

sha256sums=('9c40cf2ca405c15561c4ea031e090ef7e25ec7424937df55d942cf33c674bfab')

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
	for _file in "$_exeName" "crunch.dll" "crunchunity.dll" "libcapstone.so" "libTexture2DDecoderNative.so"; do
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

