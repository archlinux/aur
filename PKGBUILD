# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-omega-git
pkgver=1.20.0.E14.r806.ga25ebc516
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Omega firmware)"
arch=('x86_64')
url="https://getomega.dev"
license=('custom:CC-BY-NC-SA')
groups=()
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
makedepends=('freetype2' 'gendesk')
optdepends=()
provides=('numworks-omega')
conflicts=('numworks-omega')
replaces=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/Omega-Numworks/Omega.git#branch=omega-dev"
	"git+https://github.com/Omega-Numworks/Omega-Atomic.git"
	"git+https://github.com/Omega-Numworks/Omega-RPN.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
        cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/O//'
}

prepare() {
	cd "$pkgname"

	git submodule init
	git config submodule."apps/atomic".git.url $srcdir/Omega-Atomic
	git config submodule."apps/rpn".git.url $srcdir/Omega-RPN
	git submodule update

	gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "$pkgdesc" --name "Numworks Omega" --icon "${pkgname%-git}" --exec "${pkgname%-git}" --categories "Education;Emulator"
}

build() {
	cd "$pkgname"
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "$pkgname"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "ion/src/simulator/assets/logoAUR.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
