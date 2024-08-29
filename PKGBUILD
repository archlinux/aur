# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-git
pkgver=10.1.r107.g9acf01d
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'bash' 'hicolor-icon-theme' 'wine')
makedepends=('dotnet-sdk>=8.0.8.sdk401' #dotnet-sdk-bin
		'git' 'gendesk')
options=(!strip !debug)
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
install=$pkgname.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/Decompiler"
	dotnet publish -r linux-x64

	cd "$srcdir/$pkgname/GUI"
	dotnet publish -r win-x64 -p:EnableWindowsTargeting=true

	cd "$srcdir"
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname::-3}source2viewer" \
	--name="Source 2 Viewer" \
	--icon="${pkgname::-3}source2viewer" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true"
}

package() {
	# Install Decompiler
	cd "$srcdir/$pkgname/Decompiler/bin/Release/linux-x64/publish"
	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/${pkgname::-4}-decompiler"

	#Install Source2Viewer.exe

	cd "$srcdir/$pkgname/GUI/bin/Release/win-x64/publish"
	install -Dm644 "$srcdir/$pkgname/GUI/bin/Release/win-x64/publish/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/Source2Viewer.exe"

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

	install -Dm644 "$srcdir/$pkgname/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}-source2viewer.png"
	install -Dm644 "$srcdir/source2viewer.desktop" "$pkgdir/usr/share/applications/source2viewer.desktop"
}
