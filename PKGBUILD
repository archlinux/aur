# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-epsilon-git
pkgver=13.0.0.r475.g93d687abc
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Epsilon firmware)"
arch=('x86_64')
url="https://www.numworks.com/resources/engineering/software/"
license=('custom:CC-BY-NC-SA')
groups=()
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
makedepends=('freetype2' 'imagemagick' 'gendesk')
optdepends=()
provides=('numworks-epsilon')
conflicts=('numworks-epsilon')
replaces=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/numworks/epsilon.git")
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	convert -background "#FFB734" "ion/src/simulator/assets/logo.svg" "${pkgname%-git}.png"
	gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "$pkgdesc" --name "Numworks Epsilon" --icon "${pkgname%-git}" --exec "${pkgname%-git}" --categories "Education;Emulator"
}

build() {
	cd "$pkgname"
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "$pkgname"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${pkgname%-git}.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
