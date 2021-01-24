# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clight-gui-git
pkgver=r39.22a23fd
pkgrel=1
pkgdesc="Qt GUI for Clight"
arch=('x86_64')
url="https://github.com/nullobsi/clight-gui"
license=('GPL3')
depends=('clight-git' 'qt5-charts')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nullobsi/clight-gui.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '73affb7c39501d2ade8f517b07f8a2ea6e229dab0f9c28b6bd6c25b65b5f9ec2')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}/src" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	install -Dm755 "build/${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 src/resources/icons/light/*.svg -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/status"
}
