# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=source2viewer-bin
pkgver=11.1
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT' 'CC-BY-2.5')
depends=('glibc' 'gcc-libs' 'zlib')
depends_x86_64=('wine' 'bash' 'hicolor-icon-theme')
makedepends=('gendesk')
conflicts=(valveresourceformat source2viewer)
provides=(source2viewer)
replaces=(valveresourceformat)
options=(!strip !debug)
install=$pkgname.install
source=("$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=(cli-linux-x64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-x64.zip"
"Source2Viewer-${pkgver}.exe::$url/releases/download/$pkgver/Source2Viewer.exe")
source_armv7h=(cli-linux-arm-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm.zip")
source_aarch64=(cli-linux-arm64-${pkgver}.zip::"$url/releases/download/$pkgver/cli-linux-arm64.zip")
sha256sums=('701c72a19131462de733fb3b33da0c9ef5ae4dc51e9d76a146a467fa388a36ba')
sha256sums_x86_64=('5a1a4ac741f8ac7e5f30461f5e793ac22da13eb691423ce80a4b0e855d642b21'
                   'ac31da72fdd0c015edaa2d2ecc2fca5d7d34316050c0ba76db5a202908b80e34')
sha256sums_armv7h=('e3528d1ca44c21e3954775cd4707019369a41577f901f926c66cadb87d31ed43')
sha256sums_aarch64=('bdd95de834a42f0fbe4750a35855b05cd86f81dc8e98bc299bc7e728f1822cdc')


package() {
	cd "$srcdir"
	install -Dm755 Source2Viewer-CLI "$pkgdir/usr/bin/${pkgname::-3}cli"
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
