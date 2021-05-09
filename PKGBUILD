# Maintainer: Tomasz Paś <t.pas93 at gmail>
pkgname=alvr-amd-git
pkgver=r1439.b4a7bce4
pkgrel=2
pkgdesc="Experimental Linux version of ALVR. Stream VR games from your PC to your headset via Wi-Fi."
arch=('x86_64')
url="https://github.com/alvr-org/ALVR"
license=('MIT')
groups=()
depends=('ffmpeg-amd-full' 'libunwind' 'steam-native-runtime' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('alvr-amd'::'git+https://github.com/alvr-org/ALVR.git')
md5sums=('SKIP')
install=post.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	#Build the main project
	cargo xtask build-server --release
}

package() {
	install -d $pkgdir/opt/alvr
	install -d $pkgdir/usr/bin
	cp -a $srcdir/${pkgname%-git}/build/alvr_server_linux/* $pkgdir/opt/alvr
	
	ln -s /opt/alvr/ALVR\ Launcher $pkgdir/usr/bin/alvr
}
