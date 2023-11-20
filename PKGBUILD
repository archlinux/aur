# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro-git
pkgver=2023.11.0.r0.gb053cc0e
pkgrel=1
pkgdesc='A personal finance manager'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=('dotnet-runtime>=8' libadwaita)
makedepends=(blueprint-compiler 'dotnet-sdk>=8' git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url" "git+${url%denaro}cakescripts#commit=1b48cc0957fcd65c3b0f25285e84033fb5b7f542")
b2sums=('SKIP' 'SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf denaro/CakeScripts
	mv cakescripts denaro/CakeScripts
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
}
