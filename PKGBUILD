# Maintainer: Tomasz Paś <t.pas93 at gmail>
pkgname=alvr-git
pkgver=r1466.ab9f6eb7
pkgrel=1
pkgdesc="Experimental Linux version of ALVR. Stream VR games from your PC to your headset via Wi-Fi."
arch=('x86_64')
url="https://github.com/alvr-org/ALVR"
license=('MIT')
groups=()
depends=('libunwind' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('alvr'::'git+https://github.com/alvr-org/ALVR.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	#Build the main project
	cargo xtask build-server --release --bundle-ffmpeg
}

package() {
	install -d $pkgdir/opt/alvr
	install -d $pkgdir/usr/bin
	cp -a $srcdir/${pkgname%-git}/build/alvr_server_linux/* $pkgdir/opt/alvr
	
	ln -s /opt/alvr/bin/alvr_launcher $pkgdir/usr/bin/alvr
}
