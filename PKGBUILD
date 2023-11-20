# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=cavalier-git
pkgver=2023.11.0.r5.g869a1b1
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(MIT)
depends=(cava 'dotnet-runtime>=8' libadwaita iniparser fftw)
makedepends=(blueprint-compiler 'dotnet-sdk>=8' git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" "git+${url%cavalier}cakescripts#commit=1b48cc0957fcd65c3b0f25285e84033fb5b7f542")
b2sums=('SKIP' 'SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf cavalier/CakeScripts
	mv cakescripts cavalier/CakeScripts
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
	ln -sv org.nickvision.cavalier "$pkgdir"/usr/bin/cavalier
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
