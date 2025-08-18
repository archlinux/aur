# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-oss-app
pkgver=0.3.1
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(any)
url="https://docs.droposs.org/"
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'umu-launcher' 'libayatana-appindicator')
source=("git+https://github.com/Drop-OSS/drop-app.git#commit=6104bfda72a0d32c43b34084ec6aefeb542e9951")
makedepends=('yarn' 'cargo')
sha256sums=('ec3e596777321f6b045e313d007d2a013d3b236e0942940e92c7ea74eb8602f3')


_desktop="
[Desktop Entry]\n
Type=Application\n
Version=0.3.1\n
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
