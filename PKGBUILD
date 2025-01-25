# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-oss-app
pkgver=0.2.0.beta
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(x86_64)
url="https://wiki.droposs.org/"
license=('AGPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl-1.1' 'openssl')
source=("https://github.com/Drop-OSS/drop-app/archive/refs/tags/v0.2.0-beta.tar.gz")
makedepends=('yarn' 'cargo' 'openssl-1.1' 'openssl')
sha256sums=('646742ad2f32b650a5d7acadc644e6d5dd6abafc8c4688c30a08d44057e6ba29')


_desktop="
[Desktop Entry]\n
Type=Application\n
Version=1.0\n
Name=drop-oss-app\n
Comment=Arch native client for drop\n
Path=/usr/bin/\n
Exec=drop-app\n
Icon=drop-oss-app\n
Terminal=false\n
"

prepare() {
	echo $_desktop > drop-oss-app.desktop
	cd drop-app-0.2.0-beta/
	yarn
}

build() {
	export RUSTUP_TOOLCHAIN=nightly
	CFLAGS+=' -ffat-lto-objects'
	cd drop-app-0.2.0-beta
	yarn tauri build --no-bundle
}

package() {
	echo -e "$_desktop" > drop-oss-app.desktop
	install -Dm0755 -t "$pkgdir/usr/share/applications" "drop-oss-app.desktop" 
	cd drop-app-0.2.0-beta
	cp src-tauri/icons/icon.png ./drop-oss-app.png
        install -Dm0755 -t "$pkgdir/usr/share/pixmaps" "./drop-oss-app.png"
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
	#install -Dm0755 -t "$pkgdir/usr/bin" "drop-app"
}
