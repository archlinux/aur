# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=lumafly
pkgver=3.3.0.0
pkgrel=1
pkgdesc="A cross platform mod manager for Hollow Knight written in Avalonia."
arch=('x86_64')
url="https://github.com/TheMulhima/Lumafly"
license=('GPL-3.0-only')
depends=('glibc' 'dotnet-runtime-7.0' 'fontconfig' 'gcc-libs')
makedepends=('dotnet-sdk-7.0' 'gendesk')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13a6e31ad490481da0a238972edf6bbb16ebdbc6db4361b8cfd4833d3d850de0')
options=(!strip)

build() {
	cd "$srcdir/Lumafly-${pkgver}/Lumafly/"
	dotnet publish -r linux-x64 -p:PublishSingleFile=true -p:Configuration=Release --self-contained false

	timeout -k 20s 5s dotnet build-server shutdown

	cd "$srcdir"
	gendesk -f --pkgname=${pkgname} \
	--pkgdesc="${pkgdesc}" \
	--name=Lumafly \
	--exec='lumafly %f' \
	--icon="${pkgname}" \
	--terminal=false \
	--categories='Development;Game'
}

package() {
	cd "$srcdir/Lumafly-${pkgver}/Lumafly/bin/Release/net7.0/linux-x64/publish"
	for file in {Lumafly,libSkiaSharp.so,libHarfBuzzSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/Lumafly" "$pkgdir/usr/bin/lumafly"
	
	install -Dm644 "$srcdir/Lumafly-${pkgver}/Lumafly/Assets/Lumafly.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
