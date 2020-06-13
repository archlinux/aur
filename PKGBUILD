# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-omega
_pkgver=1.19.2-E13
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Omega firmware)"
arch=('x86_64')
url="https://getomega.web.app"
license=('custom:CC-BY-NC-SA')
groups=()
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
makedepends=('freetype2' 'imagemagick' 'gendesk')
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
_subpkgver=('8fa51525b7547a73c99a3f6703e8fe67055095b0'
            '8df287f39ac2ca7ce927078fc4d998a692caf283'
            '1940ed060dbe233e3682e879b7f4ee4c7ca04aa8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Omega-Numworks/Omega/archive/O$_pkgver.tar.gz"
	"https://github.com/Omega-Numworks/Omega-Atom/archive/${_subpkgver[0]}.tar.gz"
	"https://github.com/Omega-Numworks/Omega-RPN/archive/${_subpkgver[1]}.tar.gz"
	"https://github.com/Omega-Numworks/Omega-Themes/archive/${_subpkgver[2]}.tar.gz")
md5sums=('c2d6c2069cf691ac94b574cfa0877309'
         'a646c6fc43f2d46cbd4c1eaf04e0c1d6'
         'd1857a323aab2c4531d7a1008f13fa95'
         '45656d3518ec90a7e8943effc5786916')

prepare() {
	cd "Omega-O$_pkgver"

	rm -r apps/atom apps/rpn themes
	cp -r "${srcdir}"/Omega-Atom-${_subpkgver[0]} apps/atom
	cp -r "${srcdir}"/Omega-RPN-${_subpkgver[1]} apps/rpn
	cp -r "${srcdir}"/Omega-Themes-${_subpkgver[2]} themes

	convert -background "#C53431" "ion/src/simulator/assets/logo.svg" "$pkgname.png"
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Numworks Omega" --icon "$pkgname" --exec "$pkgname" --categories "Education;Emulator"
}

build() {
	cd "Omega-O$_pkgver"
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "Omega-O$_pkgver"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
