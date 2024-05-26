# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-git
pkgver=9.2.r91.g0486309
pkgrel=4
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'bash' 'hicolor-icon-theme' 'wine')
makedepends=('dotnet-sdk' 'git')
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
	dotnet publish -r win-x64 --sc true -p:EnableWindowsTargeting=true
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

	install -Dm644 "$srcdir/$pkgname/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}-source2viewer.png"

}
