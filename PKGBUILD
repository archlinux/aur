# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=cavalier-git
pkgver=V2023.7.0.beta1.r18.gb526da8
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(MIT)
depends=(cava 'dotnet-runtime>=7' libadwaita iniparser fftw)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
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
