# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-oss-app
pkgver=0.1.0.beta
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(x86_64)
url="https://wiki.droposs.org/"
license=('AGPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl-1.1' 'openssl')
source=("https://github.com/Drop-OSS/drop-app/archive/refs/tags/v0.1.0-beta.tar.gz")
#source=("file://drop-app")
makedepends=('yarn' 'cargo' 'openssl-1.1' 'openssl')
sha256sums=('cb42c23925b13eccdc231fb2a82ef7bd5be91ca5e75ec325f0908ee9eb8b6569')
#sha256sums=('9fcdf62b19336bde17e04329c7c53a69cbb6b25a11b48239641e82793f56ff4a')


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
	export RUSTUP_TOOLCHAIN=stable
	echo $_desktop > drop-oss-app.desktop
	cd drop-app-0.1.0-beta/
	yarn
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -ffat-lto-objects'
	cd drop-app-0.1.0-beta
	yarn tauri build
}

package() {
	echo -e "$_desktop" > drop-oss-app.desktop
	install -Dm0755 -t "$pkgdir/usr/share/applications" "drop-oss-app.desktop" 
	cd drop-app-0.1.0-beta
	cp src-tauri/icons/icon.png ./drop-oss-app.png
        install -Dm0755 -t "$pkgdir/usr/share/pixmaps" "./drop-oss-app.png"
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
	#install -Dm0755 -t "$pkgdir/usr/bin" "drop-app"
}