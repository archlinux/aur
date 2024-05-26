# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-bin
pkgver=9.2
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
sha256sums=('74f48ddc930b49815712384b6a0ae7f92a878f00cd97c219b2c4e7792f1b87d3'
            '37ac9e6f99e2f8e72ca2275f9da4da6f539f58c683744ef5c7655a56d935eb24'
            '2af42583605e37122ba06027d244c05ebe69b39652497ca97dcfdd0daaefca24')


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
