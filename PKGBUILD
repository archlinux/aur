# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=steamdepotdownloadergui
_pkgname=SteamDepotDownloaderGUI
pkgver=3.2.1
pkgrel=1
pkgdesc="Downgrade Steam games to older versions with ease using DepotDownloader"
arch=('x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL-3.0-only')
depends=('glibc' 'webkit2gtk-4.1' 'libgcc' 'gtk3' 'cairo' 'libsoup3' 'bzip2' 'openssl' 'gdk-pixbuf2' 'hicolor-icon-theme' 'glib2' 'pango'
	 'bash' 'dbus')
makedepends=('cargo' 'pnpm' 'cargo-tauri')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('603878856f8365f53514c93bad4b67871166680419461c67b7a50f7c230c24c9')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	pnpm c --location project set store-dir "${srcdir}/pnpm-store" #don't put pnpm files in user's home
	pnpm c --location project set cacheDir "${srcdir}/pnpm-cache"
	pnpm i
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname-$pkgver/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	cargo tauri build -b deb -t "$(rustc -vV | sed -n 's/host: //p')"
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
