# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-bin
pkgver=10.0
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib' 'wine' 'bash' 'hicolor-icon-theme')
conflicts=(valveresourceformat)
provides=(valveresourceformat)
options=(!strip !debug)
install=$pkgname.install
source=("$url/releases/download/$pkgver/Decompiler-linux-x64.zip"
	"$url/releases/download/$pkgver/Source2Viewer.exe"
	"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d2128173623aa851427609a776568688431879cbf6607341bf604b2450bc70c6'
            '78f38f082937ef6a647f4468252b95ba35d62ef9220011818c0b17ff43a584bf'
            '426eb7430e18fcc89ad2bea826a7cb41b02099e8dff5c8cedf8ce93e8e3d8706')


package() {
	cd "$srcdir"
	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/${pkgname::-4}-decompiler"

	install -Dm644 "$srcdir/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/Source2Viewer.exe"
	cat >> "$pkgdir/usr/bin/${pkgname::-4}-source2viewer" <<-EOF
#!/bin/bash
export WINEPREFIX="\$HOME/.${pkgname::-4}/wine"
if [ ! -d "\$HOME"/.${pkgname::-4} ];
then
	mkdir -p "\$HOME/.${pkgname::-4}/wine"
	wineboot -u
fi
cd "\$HOME/.${pkgname::-4}"
DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/Source2Viewer.exe "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}-source2viewer"

	mkdir -p "$pkgdir/usr/share/applications"
	cat >> "$pkgdir/usr/share/applications/source2viewer.desktop" <<-EOF
[Desktop Entry]
Version=$pkgver
Name=Source 2 Viewer
Comment=Valve's Source 2 resource file format parser, decompiler, and exporter
Exec=${pkgname::-4}-source2viewer %f
Icon=${pkgname::-4}-source2viewer
Terminal=false
Type=Application
Categories=Development;Utility;Wine;
PrefersNonDefaultGPU=true
EOF

	install -Dm644 "$srcdir/ValveResourceFormat-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}-source2viewer.png"
}
