# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=tagger-git
pkgver=2023.11.3.r1.g40ac3fa7
pkgrel=1
pkgdesc='Tag your music'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=('dotnet-runtime>=8' ffmpeg libadwaita chromaprint webp-pixbuf-loader)
makedepends=(blueprint-compiler 'dotnet-sdk>=8' git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url" "git+${url%tagger}cakescripts#commit=1b48cc0957fcd65c3b0f25285e84033fb5b7f542")
b2sums=(SKIP SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf tagger/CakeScripts
	mv cakescripts tagger/CakeScripts
	cd ${pkgname%-git}
	dotnet tool restore
}

build() {
	cd ${pkgname%-git}
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd ${pkgname%-git}
	dotnet cake --target=Install --destdir="$pkgdir"
	ln -sv org.nickvision.tagger "$pkgdir"/usr/bin/tagger
}
