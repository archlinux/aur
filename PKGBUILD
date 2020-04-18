# Maintainer: Andres Gongora <mail at andresgongora dot com>

pkgname="synth-shell-prompt-git"
pkgver=v1.0.r0.g139e2e3
pkgrel=1
_branch=master
pkgdesc="Fancy terminal prompt with colors and git support"
arch=('any')
url="https://github.com/andresgongora/synth-shell-prompt"
license=('GPL3')
depends=('sed')
makedepends=('git' 'sed' 'grep')
optdepends=("")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/andresgongora/${pkgname%-git}.git#branch=$_branch")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
}


build() {
	cd "$srcdir/${pkgname%-git}"
	chmod +x ./setup.sh
	rm -rf build
	./setup.sh "build/${pkgname%-git}.sh" "build/config"	
}


package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 "./build/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -d "$pkgdir/etc/synth-shell/"
	(cd "build/config" && find -type f -exec install -Dm 644 "{}" "$pkgdir/etc/synth-shell/{}" \;)
}
