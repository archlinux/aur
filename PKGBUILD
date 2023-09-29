# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic-git
pkgver=2023.9.1.r0.g27dd4c32
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=(aria2 dee 'dotnet-runtime>=7' ffmpeg libadwaita python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp python-psutil)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
replaces=(tube-converter-git)
provides=(${pkgname%-git} tube-converter)
conflicts=(${pkgname%-git} tube-converter)
source=("git+$url" "git+${url%parabolic}cakescripts.git#commit=d8dda8b25499cdedb6cb015db18e54d7ea720ac3")
b2sums=('SKIP' 'SKIP')

pkgver() {
	cd parabolic
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf parabolic/CakeScripts
	mv cakescripts parabolic/CakeScripts
	cd parabolic
	dotnet tool restore
}

build() {
	cd parabolic
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd parabolic
	dotnet cake --target=Install --destdir="$pkgdir"
	ln -sv org.nickvision.tubeconverter "$pkgdir"/usr/bin/parabolic
}
