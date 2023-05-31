# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=tube-converter-git
pkgver=2023.5.0.rc2.r0.gf687b33
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/tubeconverter
license=(GPL3)
depends=(aria2 'dotnet-runtime>=7' ffmpeg libadwaita python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd tubeconverter
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd tubeconverter
	dotnet tool restore
}

build() {
	cd tubeconverter
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd tubeconverter
	dotnet cake --target=Install --destdir="$pkgdir"
	ln -sv org.nickvision.tubeconverter "$pkgdir"/usr/bin/tubeconverter
}
