# Maintainer: Ronny R <ronny-aur[at]adke*org>
pkgname=rfled-server-git
pkgver=r20.68cbf57
pkgrel=1
pkgdesc="Golang binary to emulate a LimitlessLED WiFi Bridge 4.0 unit."
arch=('x86_64' 'i686' 'x86_64')
url="https://github.com/riptidewave93/RFLED-Server"
license=('GPL')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rfled-server::git+https://github.com/riptidewave93/RFLED-Server.git'
	'rfled-server.service')
md5sums=('SKIP'
         'ba63d4f5ccdb521a8225b6c00c503649')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh
}

package() {
	install -D "rfled-server.service" -t $pkgdir/usr/lib/systemd/system/
	cd "$srcdir/${pkgname%-git}"
	case "$CARCH" in
		armv7h)
			install -D -T -m744 -o root:root "bin/rfled-server-armv7" $pkgdir/usr/bin/rfled-server
			;;
		x86_64)
			install -D -T -m744 -o root -g root "bin/rfled-server-amd64" $pkgdir/usr/bin/rfled-server
			;;
	esac
}
