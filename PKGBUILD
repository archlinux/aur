# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-oss-app
pkgver=0.2.1
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(any)
url="https://wiki.droposs.org/"
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'openssl-1.1' 'openssl')
source=("https://codeload.github.com/Drop-OSS/drop-app/tar.gz/refs/tags/dev-v0.2.1-beta")
makedepends=('yarn' 'cargo' 'openssl-1.1' 'openssl')
sha256sums=('e167cd86dd995c9079a1e6bf613b37e2745ba4c2dab32843d1836e3e6acc417e')


_desktop="
[Desktop Entry]\n
Type=Application\n
Version=1.0\n
Name=drop-oss-app\n
Comment=Drop client for Linux\n
Path=/usr/bin/\n
Exec=drop-app\n
Icon=drop-oss-app\n
Terminal=false\n
"

prepare() {
	echo $_desktop > drop-oss-app.desktop
	cd drop-app-dev-v0.2.1-beta/
	yarn
}

build() {
	export RUSTUP_TOOLCHAIN=nightly
	CFLAGS+=' -ffat-lto-objects'
	cd drop-app-dev-v0.2.1-beta
	yarn tauri build --no-bundle
}

package() {
	echo -e "$_desktop" > drop-oss-app.desktop
	install -Dm0755 -t "$pkgdir/usr/share/applications" "drop-oss-app.desktop" 
	cd drop-app-dev-v0.2.1-beta
	cp src-tauri/icons/icon.png ./drop-oss-app.png
        install -Dm0755 -t "$pkgdir/usr/share/pixmaps" "./drop-oss-app.png"
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
	#install -Dm0755 -t "$pkgdir/usr/bin" "drop-app"
}
