# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=source2viewer-git
pkgver=13.0.r161.g6c1ed75
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'bash' 'hicolor-icon-theme' 'wine' 'dotnet-runtime')
makedepends=('dotnet-sdk-bin' #dotnet-sdk-bin
		'git' 'gendesk')
options=(!strip !debug)
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}" valveresourceformat)
replaces=(valveresourceformat)
install=$pkgname.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/CLI"
	dotnet publish -r linux-x64 --self-contained false

	cd "$srcdir/$pkgname/GUI"
	dotnet publish -r win-x64 -p:EnableWindowsTargeting=true

	#Stop dotnet build server
	dotnet build-server shutdown

	cd "$srcdir"
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname::-4}" \
	--name="Source 2 Viewer" \
	--icon="${pkgname::-4}" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true" \
	--mimetypes="application/x-source2viewer-vpk"
}

package() {
	# Install CLI
	cd "$srcdir/$pkgname/CLI/bin/Release/linux-x64/publish"
	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgname::-4}-cli"

	#Install Source2Viewer.exe

	cd "$srcdir/$pkgname/GUI/bin/Release/win-x64/publish"
	install -Dm644 "$srcdir/$pkgname/GUI/bin/Release/win-x64/publish/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/${pkgname::-4}.exe"

	cat >> "$pkgdir/usr/bin/${pkgname::-4}" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.${pkgname::-4}/wine"
if [ ! -d "\$HOME"/.${pkgname::-4} ];
then
	mkdir -p "\$HOME/.${pkgname::-4}/wine"
	wineboot -u
fi
cd "\$HOME/.${pkgname::-4}"
DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/${pkgname::-4}.exe "\$@"
EOF
	cat >> "$pkgdir/usr/bin/${pkgname::-3}wine" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.${pkgname::-4}/wine"
if [ ! -d "\$HOME"/.${pkgname::-4} ];
then
	mkdir -p "\$HOME/.${pkgname::-4}/wine"
	wineboot -u
fi
wine "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-3}wine"

	install -Dm644 "$srcdir/$pkgname/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}.png"
	install -Dm644 "$srcdir/${pkgname::-4}.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"

	install -dm755 "$pkgdir/usr/share/mime/packages"
	cat >> "$pkgdir/usr/share/mime/packages/${pkgname}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
	<mime-type type="application/x-source2viewer-vpk">
		<comment>Valve Pack File</comment>
		<icon name="source2viewer"/>
		<acronym>VPK</acronym>
		<expanded-acronym>Valve Pack File</expanded-acronym>
		<global-deleteall/>
		<glob pattern="*.vpk"/>
		<glob pattern="*.VPK"/>
	</mime-type>
</mime-info>
EOF
}
