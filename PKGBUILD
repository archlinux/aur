# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=steamdepotdownloadergui
_pkgname=SteamDepotDownloaderGUI
pkgver=3.0.1
pkgrel=1
pkgdesc="Downgrade Steam games to older versions with ease using DepotDownloader"
arch=('x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL-3.0-only')
depends=('glibc' 'webkit2gtk-4.1' 'gcc-libs' 'gtk3' 'cairo' 'libsoup3' 'bzip2' 'openssl' 'gdk-pixbuf2' 'hicolor-icon-theme' 'glib2' 'pango'
	 'bash')
makedepends=('cargo' 'pnpm')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97df0696fb2bce16bfe94b452eaeb2d851beb7b53eced32d444690e6be83849b')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	pnpm i
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname-$pkgver/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	pnpm tauri build -b deb -t "$(rustc -vV | sed -n 's/host: //p')"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/src-tauri/target/$(rustc -vV | sed -n 's/host: //p')/release/bundle/deb/${_pkgname}_${pkgver}_amd64/data/"

	install -Dm755 usr/bin/vectum "$pkgdir/usr/lib/${pkgname}/${pkgname}"
	install -Dm644 usr/share/applications/${_pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
	for size in {32,128,256@2};
	do
		install -Dm644 usr/share/icons/hicolor/${size%@2}x${size}/apps/vectum.png "$pkgdir/usr/share/icons/hicolor/${size%@2}x${size%@2}/apps/${pkgname}.png"
	done

	sed -i 's/Categories=/Categories=Development/g' "$pkgdir/usr/share/applications/${pkgname}.desktop"
	sed -i 's/vectum/steamdepotdownloadergui/g' "$pkgdir/usr/share/applications/${pkgname}.desktop"

	install -dm755 "$pkgdir/usr/bin"
	cat >> "$pkgdir/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
[[ ! -d \$HOME/.config/${pkgname} ]] && mkdir \$HOME/.config/${pkgname}
cd \$HOME/.config/${pkgname} || exit
/usr/lib/${pkgname}/${pkgname} "\$@"
wait
exit
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname}"
}
