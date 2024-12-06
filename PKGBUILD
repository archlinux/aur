# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=source2viewer-bin
pkgver=11.0
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib' 'wine' 'bash' 'hicolor-icon-theme')
makedepends=('gendesk')
conflicts=(valveresourceformat source2viewer)
provides=(source2viewer)
replaces=(valveresourceformat)
options=(!strip !debug)
install=$pkgname.install
source=(cli-linux-x64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-x64.zip"
	"Source2Viewer-${pkgver}.exe::$url/releases/download/$pkgver/Source2Viewer.exe"
	"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('231fc224ef59822deabc1d48899c385b9adff919d56b6b1bf42669dde2f77847'
            '44c3b791398b7f1fe9c488965dc665e410b08397fe415bccdaa592bd4df2d9cd'
            '47f37d12f178d73d568d2e3a58fb129f025e5237842a28e9d03989847c2d89f5')


package() {
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

	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgname::-3}cli"

	install -Dm644 "$srcdir/Source2Viewer-${pkgver}.exe" "$pkgdir/usr/lib/$pkgname/${pkgname::-4}.exe"
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

	mkdir -p "$pkgdir/usr/share/applications"

	install -Dm644 "$srcdir/ValveResourceFormat-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}.png"
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
