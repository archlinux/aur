#Maintainer: EMPTY <testerthe60@gmail.com>
pkgname=numworks-upsilon-git
pkgver=1.22.1.E15.r540
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Upsilon firmware)"
arch=('x86_64')
url="https://getupsilon.web.app/"
license=('custom:CC-BY-NC-SA')
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
provides=('numworks-upsilon')
conflicts=('numworks-upsilon')
makedepends=('freetype2' 'gendesk')

source=("$pkgname::git+https://github.com/UpsilonNumworks/Upsilon.git"
		"git+https://github.com/UpsilonNumworks/Upsilon-RPN.git"
		"git+https://github.com/UpsilonNumworks/atomic.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
        cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/O//'
}

prepare() {
	cd "$pkgname"

	git submodule init
	git config submodule."apps/rpn".git.url $srcdir/Upsilon-RPN
	git config submodule."apps/atomic".git.url $srcdir/atomic
	git submodule update

	gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "$pkgdesc" --name "Numworks Upsilon" --icon "${pkgname%-git}" --exec "${pkgname%-git}" --categories "Education;Emulator"
}

build() {
	cd "$pkgname"
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "$pkgname"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 "ion/src/simulator/assets/logoAUR.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	msg "=============================================================================="
	msg "        The Upsilon simulator should now be available in your app menu,       "
	msg " to lunch it from the terminal run ${pkgname%-git} (/usr/bin/${pkgname%-git}) "
	msg "=============================================================================="
}
