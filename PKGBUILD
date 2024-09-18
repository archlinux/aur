# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-bin
pkgver=10.2
pkgrel=2
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib' 'wine' 'bash' 'hicolor-icon-theme')
makedepends=('gendesk')
conflicts=(valveresourceformat)
provides=(valveresourceformat)
options=(!strip !debug)
install=$pkgname.install
source=("$url/releases/download/$pkgver/Decompiler-linux-x64.zip"
	"$url/releases/download/$pkgver/Source2Viewer.exe"
	"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f6782347c994783f7f8608cdf5db7d18f75c46adae0cf102bfdace58b1831186'
            '2df456c6e370bcc92d88e9e95c5ff31a1c49048c7abcff81e6638997107d99ff'
            '61fa22f19141f15ac3fb533b75db10bb93b55622af038d82cd7e8949b28e2ee0')


package() {
	cd "$srcdir"
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname::-3}source2viewer" \
	--name="Source 2 Viewer" \
	--icon="${pkgname::-3}source2viewer" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true"

	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/${pkgname::-4}-decompiler"

	install -Dm644 "$srcdir/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/Source2Viewer.exe"
	cat >> "$pkgdir/usr/bin/${pkgname::-4}-source2viewer" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.${pkgname::-4}/wine"
if [ ! -d "\$HOME"/.${pkgname::-4} ];
then
	mkdir -p "\$HOME/.${pkgname::-4}/wine"
	wineboot -u
fi
cd "\$HOME/.${pkgname::-4}"
DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/Source2Viewer.exe "\$@"
EOF
	cat >> "$pkgdir/usr/bin/${pkgname::-4}-wine" <<-EOF
#!/usr/bin/env bash
if [ ! -d "\$HOME"/.${pkgname::-4} ];
then
	mkdir -p "\$HOME/.${pkgname::-4}/wine"
	wineboot -u
fi
export WINEPREFIX="\$HOME/.${pkgname::-4}/wine"
wine "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}-source2viewer" "$pkgdir/usr/bin/${pkgname::-4}-wine"

	mkdir -p "$pkgdir/usr/share/applications"

	install -Dm644 "$srcdir/ValveResourceFormat-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}-source2viewer.png"
	install -Dm644 "$srcdir/source2viewer.desktop" "$pkgdir/usr/share/applications/source2viewer.desktop"
}
