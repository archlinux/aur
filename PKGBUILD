# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-omega
_pkgver=1.20.2-E14
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
_subpkgver=('8f710a9d3fa4daedde14ba489e418dbac5d590c5'
            '279ec6333ab15e08988dff66eea01c6fdaee4ea0'
            'd9bc63ee68351e2f57cbab3edcdeeca8e077c7df')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Omega-Numworks/Omega/archive/O$_pkgver.tar.gz"
	"https://github.com/Omega-Numworks/Omega-Atom/archive/${_subpkgver[0]}.tar.gz"
	"https://github.com/Omega-Numworks/Omega-RPN/archive/${_subpkgver[1]}.tar.gz"
	"https://github.com/Omega-Numworks/Omega-Themes/archive/${_subpkgver[2]}.tar.gz")
md5sums=('52d9bcb26567e9419c1fa4031096caf4'
         '9253b9e172b7838d1de2e5d1d2e70a2d'
         '61e0c0d58ea5b99c1abb22cf69db04fb'
         'a189d8fe1ef0f43139a3be5459dff22d')

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
