# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=ValveResourceFormat
pkgname=source2viewer
pkgver=10.2
pkgrel=3
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib' 'wine' 'bash' 'hicolor-icon-theme')
makedepends=('dotnet-sdk>=8.0.8.sdk401'  #dotnet-sdk-bin
		'gendesk')
options=(!strip !debug)
conflicts=('valveresourceformat')
replaces=('valveresourcefromat')
install=$pkgname.install
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('61fa22f19141f15ac3fb533b75db10bb93b55622af038d82cd7e8949b28e2ee0')


build() {
	cd "$srcdir/$_pkgname-$pkgver/Decompiler"
	dotnet publish -r linux-x64

	cd "$srcdir/$_pkgname-$pkgver/GUI"
	dotnet publish -r win-x64 -p:EnableWindowsTargeting=true

	# Stop dotnet build server
	dotnet build-server shutdown

	cd "$srcdir"
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname}" \
	--name="Source 2 Viewer" \
	--icon="${pkgname}" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Decompiler/bin/Release/linux-x64/publish"
	install -Dm755 Decompiler "$pkgdir/usr/bin/${pkgname}-cli"


	install -Dm644 "$srcdir/$_pkgname-$pkgver/GUI/bin/Release/win-x64/publish/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/$pkgname.exe"
	cat >> "$pkgdir/usr/bin/$pkgname" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.$pkgname/wine"
if [ ! -d "\$HOME"/.$pkgname ];
then
	mkdir -p "\$HOME/.$pkgname/wine"
	wineboot -u
fi
cd "\$HOME/.$pkgname"
DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/$pkgname.exe "\$@"
EOF
	cat >> "$pkgdir/usr/bin/$pkgname-wine" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.$pkgname/wine"
if [ ! -d "\$HOME"/.$pkgname ];
then
	mkdir -p "\$HOME/.$pkgname/wine"
	wineboot -u
fi
wine "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-wine"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 "$srcdir/source2viewer.desktop" "$pkgdir/usr/share/applications/source2viewer.desktop"
}
