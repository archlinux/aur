# Maintainer: Oktana Coop <team@oktana.dev>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=v2-bin
_pkgname=v2
pkgver=0.16.2
pkgrel=1
pkgdesc='A local-first, privacy oriented rich text editor with Git-style version control'
arch=(x86_64 aarch64)
url=https://v2editor.com
_url="https://github.com/oktana-coop/$_pkgname"
license=(AGPL-3.0-only)
depends=(glibc # libc.so
         # libpthread.so
         wasi-libc # libdl.so
         zlib libz.so)
optdepends=('libappindicator-gtk3: tray icon support')
provides=("v2=$pkgver")
conflicts=(v2)
options=(!strip !debug)
source_x86_64=("$_url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.AppImage")
source_aarch64=("$_url/releases/download/v$pkgver/$_pkgname-$pkgver-arm64.AppImage")
sha256sums_x86_64=('05edac4a2cf1d6a8c68bb89258983b1a5593e0b9b7e5c52585437b82c91de1ab')
sha256sums_aarch64=('b2139ae9001231dfd43038e2ba9a687adc411562eddbc0215911c41d7f05aab5')

_source="source_$CARCH"
_appimage=${!_source[0]##*/}

prepare() {
	chmod +x "$_appimage"
	"./$_appimage" --appimage-extract
	sed -e "/^Exec/s/=.*/=$_pkgname/" squashfs-root/v2.desktop > "$_pkgname.desktop"
}

package() {
	install -Dm0755 -t "$pkgdir/opt/$_pkgname/" $_appimage 
	install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<- EOF
		#!/usr/bin/env sh
		exec "/opt/$_pkgname/$_appimage" "\$@"
	EOF
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_pkgname.desktop"
	local icon_path=usr/share/icons/hicolor/512x512/apps
	install -Dm0644 -t "$pkgdir/$icon_path/" "squashfs-root/$icon_path/$_pkgname.png"
}
