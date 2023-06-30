# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=tagger-git
pkgver=2023.7.0.beta2.r31.ge317fd5
pkgrel=1
pkgdesc='Tag your music'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=('dotnet-runtime>=7' ffmpeg libadwaita chromaprint)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

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
	ln -sv org.nickvision.tagger "$pkgdir"/usr/bin/tagger
}
