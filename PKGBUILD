# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=source2viewer-bin
pkgname=(source2viewer-bin source2viewer-cli-bin)
pkgver=16.0
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('gendesk')
options=(!strip !debug)
install=$pkgname.install
source=("$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=(cli-linux-x64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-x64.zip"
"Source2Viewer-${pkgver}.exe::$url/releases/download/$pkgver/Source2Viewer.exe")
source_armv7h=(cli-linux-arm-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm.zip")
source_aarch64=(cli-linux-arm64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm64.zip")
sha256sums=('91275b86d851820715b928fb3abebef97634438d8f34735114f60b6ef5f860a3')
sha256sums_x86_64=('4121d726387dd6f154cf3398a0f8479080fdc1d06e7ccdf58580b3b850dc8921'
                   '80cee9a572feec30d3b5aacd415254b4046285372eadf2f8d08e7168f7f5e280')
sha256sums_armv7h=('6e64700fd074173ac8778a4c1cf93dfd9c5eb68ed1d14b5002cf8a5ad7541e0b')
sha256sums_aarch64=('d9449510f10b20d76b2bb51f47df372cd1b6a7c87a3b739eb938631e6e6f7ec5')


package_source2viewer-cli-bin() {
	depends=(glibc gcc-libs)
	provides=(${pkgname::-4})
	conflicts=(${pkgname::-4})
	cd "$srcdir"
	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgbase::-3}cli"
}


package_source2viewer-bin() {
	install=$pkgbase.install
	provides=(${pkgbase::-4})
	conflicts=(${pkgbase::-4})
	depends_x86_64+=( 'wine' 'bash' 'hicolor-icon-theme')
	cd "$srcdir"
	case $CARCH in
		x86_64)
	gendesk -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname::-4}" \
	--name="Source 2 Viewer" \
	--icon="${pkgname::-4}" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true" \
	--mimetypes="application/x-source2viewer-vpk"


	install -Dm644 "$srcdir/Source2Viewer-${pkgver}.exe" "$pkgdir/usr/lib/$pkgname/${pkgname::-4}.exe"
	install -dm755 "$pkgdir/usr/bin"
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
;;
esac
}
