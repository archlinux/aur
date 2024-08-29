# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=ValveResourceFormat
pkgname=valveresourceformat
pkgver=10.1
pkgrel=2
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib' 'wine' 'bash' 'hicolor-icon-theme')
makedepends=('dotnet-sdk>=8.0.8.sdk401'  #dotnet-sdk-bin
		'gendesk')
options=(!strip !debug)
install=$pkgname.install
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('804760437d37546fe64673259d4ece34f08543893df56cc3701e9c6e46f32dfa')


build() {
	cd "$srcdir/$_pkgname-$pkgver/Decompiler"
	dotnet publish -r linux-x64

	cd "$srcdir/$_pkgname-$pkgver/GUI"
	dotnet publish -r win-x64 -p:EnableWindowsTargeting=true

	cd "$srcdir"
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname}-source2viewer" \
	--name="Source 2 Viewer" \
	--icon="${pkgname}-source2viewer" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Decompiler/bin/Release/linux-x64/publish"
	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/$pkgname-decompiler"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/GUI/bin/Release/win-x64/publish/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/Source2Viewer.exe"
	cat >> "$pkgdir/usr/bin/$pkgname-source2viewer" <<-EOF
#!/bin/bash
export WINEPREFIX="\$HOME/.$pkgname/wine"
if [ ! -d "\$HOME"/.$pkgname ];
then
	mkdir -p "\$HOME/.$pkgname/wine"
	wineboot -u
fi
cd "\$HOME/.$pkgname"
DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/Source2Viewer.exe "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname-source2viewer"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname-source2viewer.png"
	install -Dm644 "$srcdir/source2viewer.desktop" "$pkgdir/usr/share/applications/source2viewer.desktop"
}
