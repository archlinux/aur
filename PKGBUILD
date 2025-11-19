# Maintainer: quexeky <aur@quexeky.dev>
# Maintainer: DecDuck <declanahofmeyr@gmail.com>

## How to update
# Update the source to the latest .tar.gz from GitHub
# Update the sha256 sum
# Update the "cd drop-app-VER" command in prepare & build

pkgname=drop-oss-app
pkgver=0.3.4
pkgrel=1
pkgdesc="Desktop client for the Drop OSS project."
arch=(any)
url="https://droposs.org/"
license=('AGPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'umu-launcher' 'libappindicator' 'libayatana-appindicator')
source=("git+https://github.com/Drop-OSS/drop-app.git#commit=28d7a741c12b318959717e3e788fafaf29c8493c")
makedepends=('pnpm' 'cargo' 'gcc' 'pkgconf')
sha256sums=('7122692292968c80f1bcab189d7580fa3318bd6e66f703bd14ce6bc642452918')

_desktop="
[Desktop Entry]\n
Type=Application\n
Version=0.3.4\n
Name=Drop Desktop App\n
Comment=Drop client for Linux\n
Path=/usr/bin/\n
Exec=drop-app\n
Icon=drop-oss-app\n
Terminal=false\n
"

prepare() {
	echo $_desktop > drop-oss-app.desktop
	cd drop-app/
	git submodule update --init --recursive
}

build() {
	cd drop-app/
	git submodule update --init --recursive
	pnpm install
	export RUSTUP_TOOLCHAIN=nightly
	CFLAGS+=' -ffat-lto-objects'
	pnpm tauri build --no-bundle
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
