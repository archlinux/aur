# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=source2viewer-bin
pkgname=(source2viewer-bin source2viewer-cli-bin)
pkgver=15.0
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
sha256sums=('8e7a7bfa748f2f758e003a88cd3366f5a08caf02a8e6bd83120000547e041ec2')
sha256sums_x86_64=('55f3d29984350388c6a064bdb7c00c73de37022c2c2e52289b3052fc6fd1b93a'
                   '2853a32083c27b146458b16ed31dee5ce5b3b26ff8b7343a956ec4ad76f36ff0')
sha256sums_armv7h=('bfa8b6fd1c98d683131069e7dd607bf9498242dc7693fb5f827906a16fcaf2ca')
sha256sums_aarch64=('34fb7f08332c9d1258e21933dab1dff8e2afb826409699e767bfa3274b1f673c')


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
