# Maintainer: quexeky <aur@quexeky.dev>
# Maintainer: DecDuck <declanahofmeyr@gmail.com>

## How to update
# Update the source to the latest .tar.gz from GitHub
# Update the sha256 sum
# Update the "cd drop-app-VER" command in prepare & build

pkgname=drop-oss-app
pkgver=0.3.3
pkgrel=1
pkgdesc="Desktop client for the Drop OSS project."
arch=(any)
url="https://droposs.org/"
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'umu-launcher')
# source=("git+https://github.com/Drop-OSS/drop-app.git#commit=7e70a17a43f54aa6adc71138a49ec18966eaa903")
source=('https://github.com/Drop-OSS/drop-app/archive/refs/tags/v0.3.3.tar.gz')
makedepends=('yarn' 'cargo')
sha256sums=('9e543fc518e76c5bfc2e43391eb297c0420826eada8909ece60f7cfa7f3553ff')

_desktop="
[Desktop Entry]\n
Type=Application\n
Version=0.3.3\n
Name=Drop Desktop App\n
Comment=Drop client for Linux\n
Path=/usr/bin/\n
Exec=drop-app\n
Icon=drop-oss-app\n
Terminal=false\n
"

prepare() {
	echo $_desktop > drop-oss-app.desktop
	cd drop-app-0.3.3/
	git submodule update --init --recursive
}

build() {
	cd drop-app-0.3.3/
	yarn
	export RUSTUP_TOOLCHAIN=nightly
	CFLAGS+=' -ffat-lto-objects'
	yarn tauri build --no-bundle
}

package() {
	echo -e "$_desktop" > drop-oss-app.desktop
	install -Dm0755 -t "$pkgdir/usr/share/applications" "drop-oss-app.desktop" 
	cd drop-app-0.3.3
	cp src-tauri/icons/icon.png ./drop-oss-app.png
        install -Dm0755 -t "$pkgdir/usr/share/pixmaps" "./drop-oss-app.png"
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
	#install -Dm0755 -t "$pkgdir/usr/bin" "drop-app"
}
