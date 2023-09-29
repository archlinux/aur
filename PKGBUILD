# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2023.9.1
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/$pkgname
license=(GPL3)
depends=(aria2 dee 'dotnet-runtime>=7' ffmpeg gnome-common libadwaita libdbusmenu-gtk3 libunity python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp python-psutil)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=(tube-converter)
replaces=(tube-converter)
conflicts=(tube-converter)
source=("git+$url#tag=$pkgver" "git+${url%parabolic}cakescripts.git#commit=75d0c1859b062b57d73fb466321258b00c94d6ef")
b2sums=('SKIP' 'SKIP')

prepare() {
	rm -rf $pkgname/CakeScripts
	mv cakescripts $pkgname/CakeScripts
	cd $pkgname
	dotnet tool restore
}

build() {
	cd $pkgname
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd $pkgname
	dotnet cake --target=Install --destdir="$pkgdir"
	ln -sv org.nickvision.tubeconverter "$pkgdir"/usr/bin/$pkgname
}

