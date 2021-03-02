# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-omega
_pkgver=1.21.0-E15
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Omega firmware)"
arch=('x86_64')
url="https://getomega.dev"
license=('custom:CC-BY-NC-SA')
groups=()
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
makedepends=('freetype2' 'gendesk')
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
_subpkgver=('8f710a9d3fa4daedde14ba489e418dbac5d590c5'
            '67d66295b0a5a9bc5daf52412db9ae2ac87bbf57')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Omega-Numworks/Omega/archive/O$_pkgver.tar.gz"
	"https://github.com/Omega-Numworks/Omega-Atom/archive/${_subpkgver[0]}.tar.gz"
	"https://github.com/Omega-Numworks/Omega-RPN/archive/${_subpkgver[1]}.tar.gz")
md5sums=('974f3cb5aa2e481563e93e8ae3ffb1e5'
         '9253b9e172b7838d1de2e5d1d2e70a2d'
         'ed2e66171fbfa495d897bc6b2ac8b549')

prepare() {
	cd "Omega-O$_pkgver"

	rm -r apps/atom apps/rpn
	cp -r "${srcdir}"/Omega-Atom-${_subpkgver[0]} apps/atom
	cp -r "${srcdir}"/Omega-RPN-${_subpkgver[1]} apps/rpn

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
	install -Dm644 "ion/src/simulator/assets/logoAUR.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
