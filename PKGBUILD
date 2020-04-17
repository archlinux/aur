# Maintainer: Andres Gongora <mail at andresgongora dot com>

pkgname="synth-shell-greeter-git"
pkgver=v1.1.r0.gd32361d
pkgrel=1
_branch=master
pkgdesc="Terminal greeter to overwiew system health and status"
arch=('any')
url="https://github.com/andresgongora/synth-shell-greeter"
license=('GPL3')
depends=('bash' 'bc' 'sed' 'grep' 'ldns' 'lm_sensors')
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
