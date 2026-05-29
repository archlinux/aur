# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=source2viewer-bin
pkgname=(source2viewer-bin source2viewer-cli-bin)
pkgver=19.2
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
makedepends=('gendesk')
options=(!strip !debug)
install=$pkgname.install
source=("$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=(cli-linux-x64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-x64.zip"
"Source2Viewer-${pkgver}.exe::$url/releases/download/$pkgver/Source2Viewer.exe")
source_armv7h=(cli-linux-arm-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm.zip")
source_aarch64=(cli-linux-arm64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm64.zip")
sha256sums=('6f1b59fc9e480ea65fb7cd7a667758e6105988a13d1b96edbc64f274f691522d')
sha256sums_x86_64=('30d86dfd72bf35c8a38015c81bd92f0b04b1f49304e73a5d734c875803b2685b'
                   'a6673ebcd735212f8769e6991562377ad7fb10f7ff089c5fa20c1554a1476e8c')
sha256sums_armv7h=('2300298d5eac8ac14ce61990dcf41b8a60bc59ad376cfc275193f878488526e7')
sha256sums_aarch64=('a8bf4f9d01ceba82d798b10d7df33770a46b14e70f1fcfb86d3c06fb461f1406')


package_source2viewer-cli-bin() {
	depends=(glibc libstdc++ libgcc)
	provides=(${pkgname::-4})
	conflicts=(${pkgname::-4})
	cd "$srcdir"
	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgbase::-3}cli"
	install -Dm644 ValveResourceFormat-${pkgver}/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}


package_source2viewer-bin() {
	install=$pkgbase.install
	provides=(${pkgbase::-4})
	conflicts=(${pkgbase::-4})
	depends_x86_64+=( 'wine' 'bash' 'hicolor-icon-theme')
	cd "$srcdir"
	case $CARCH in
		x86_64)
	gendesk -n -f --pkgname=source2viewer \
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
DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/${pkgname::-4}.exe "\$@"
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

	install -Dm644 "$srcdir/ValveResourceFormat-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"

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
