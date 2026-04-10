# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=ValveResourceFormat
pkgbase=source2viewer
pkgname=(source2viewer source2viewer-cli)
pkgver=19.1
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
makedepends=('dotnet-sdk-bin' 'gendesk')
options=(!strip !debug)
conflicts=('valveresourceformat')
replaces=('valveresourcefromat')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4502bb0437eed369cd7f8c74653d3731c466c7e07184b3d277f710db0d704ed6')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
}



build() {
	export NUGET_PACKAGES="${srcdir}/.nuget"
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
	export DOTNET_NOLOGO=true
	export DOTNET_CLI_TELEMETRY_OPTOUT=true

	cd "$srcdir/$_pkgname-$pkgver/CLI"
	dotnet publish -r linux-x64 --self-contained false

	cd "$srcdir/$_pkgname-$pkgver/GUI"
	dotnet publish -r win-x64 -p:EnableWindowsTargeting=true

	# Stop dotnet build server
	dotnet build-server shutdown

	cd "$srcdir"
	gendesk -n -f --pkgname=source2viewer \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname}" \
	--name="Source 2 Viewer" \
	--icon="${pkgname}" \
	--terminal=false \
	--categories="Development;Utility;Wine" \
	--custom="PrefersNonDefaultGPU=true" \
	--mimetypes="application/x-source2viewer-vpk"
}

package_source2viewer() {
	install=$pkgbase.install
	depends=('bash' 'hicolor-icon-theme' 'dotnet-runtime-bin' 'wine')
	install -Dm644 "$srcdir/$_pkgname-$pkgver/GUI/bin/Release/win-x64/publish/Source2Viewer.exe" "$pkgdir/usr/lib/$pkgname/$pkgname.exe"
	install -dm755 "$pkgdir/usr/bin"
	cat >> "$pkgdir/usr/bin/$pkgname" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.$pkgname/wine"
if [ ! -d "\$HOME"/.$pkgname ];
then
	mkdir -p "\$HOME/.$pkgname/wine"
	wineboot -u
fi
cd "\$HOME/.$pkgname"
DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 DOTNET_BUNDLE_EXTRACT_BASE_DIR=./ wine /usr/lib/$pkgname/$pkgname.exe "\$@"
EOF
	cat >> "$pkgdir/usr/bin/$pkgname-wine" <<-EOF
#!/usr/bin/env bash
export WINEPREFIX="\$HOME/.$pkgname/wine"
if [ ! -d "\$HOME"/.$pkgname ];
then
	mkdir -p "\$HOME/.$pkgname/wine"
	wineboot -u
fi
wine "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-wine"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/Misc/Icons/source2viewer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 "$srcdir/source2viewer.desktop" "$pkgdir/usr/share/applications/source2viewer.desktop"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"

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

package_source2viewer-cli() {
	depends=('glibc' 'libgcc' 'libstdc++')
	cd "$srcdir/$_pkgname-$pkgver/CLI/bin/Release/linux-x64/publish"
	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgbase}-cli"
	install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
