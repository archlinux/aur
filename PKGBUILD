# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-oss-app
pkgver=0.3.0
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(any)
url="https://docs.droposs.org/"
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'umu-launcher')
source=("git+https://github.com/Drop-OSS/drop-app.git#commit=40d545a77c47e0cbbe5ef33b0d69fe70bba6b943")
makedepends=('yarn' 'cargo')
sha256sums=('a2fcffd06cdae308ea9aa0d302d8821d4912bbc796b0127a8be4e1c5820be2ec')




_desktop="
[Desktop Entry]\n
Type=Application\n
Version=0.3.0\n
Name=drop-oss-app\n
Comment=Drop client for Linux\n
Path=/usr/bin/\n
Exec=drop-app\n
Icon=drop-oss-app\n
Terminal=false\n
"

prepare() {
	echo $_desktop > drop-oss-app.desktop
	cd drop-app/
	git submodule init
	git submodule update --recursive
	yarn
}

build() {
	export RUSTUP_TOOLCHAIN=nightly
	CFLAGS+=' -ffat-lto-objects'
	cd drop-app
	yarn tauri build --no-bundle
}

package() {
	echo -e "$_desktop" > drop-oss-app.desktop
	install -Dm0755 -t "$pkgdir/usr/share/applications" "drop-oss-app.desktop" 
	cd drop-app
	cp src-tauri/icons/icon.png ./drop-oss-app.png
        install -Dm0755 -t "$pkgdir/usr/share/pixmaps" "./drop-oss-app.png"
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
	#install -Dm0755 -t "$pkgdir/usr/bin" "drop-app"
}
