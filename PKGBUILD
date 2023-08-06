pkgname=sonobus-aooserver-git
pkgver=0.0.0.r22.b495747
pkgrel=2
pkgdesc="Server-side for an easy to use application for streaming high-quality, low-latency peer-to-peer audio, Git version"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=(
	"sonobus::git+https://github.com/essej/aooserver.git#branch=master"
	"aooserver.service"
	"mutex.diff"
)
sha512sums=('SKIP'
            'ee28b8728d2236be2c2f21abb43c29fc6a18243a7147e3b322ccdc50086e1b38a978d8ad730da28ae08aa80006d0be5112bfc4ea243ac63498ed4cd102057896'
            '8a5bc22995182dfcf0ec1b58254f892f3109f1dd2cb01bbd98ae2703b5b670ba946a4787f7260e64e47e2e3e602102be81b95dfd8284e91c6491d58c8b97b49f')

pkgver() {
	cd sonobus
	echo -n 0.0.0.r$(git log --oneline | wc -l).
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd sonobus
	patch -p0 < "${srcdir}/mutex.diff"
}

build() {
	cd sonobus
	cd Builds/LinuxMakefile
	CONFIG=Release make
}

package() {
	cd "sonobus"
	install -d "$pkgdir/usr/bin"
	install Builds/LinuxMakefile/build/aooserver "$pkgdir/usr/bin"
	install -d "$pkgdir/etc/systemd/system"
	install "$srcdir/aooserver.service" "$pkgdir/etc/systemd/system/aooserver.service"
}
