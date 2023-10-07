# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
pkgname=fan2go-tui-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal UI for fan2go."
arch=('x86_64')
url="https://github.com/markusressel/fan2go-tui"
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git')
provides=("fan2go-tui")
conflicts=("fan2go-tui")
source=('git+https://github.com/markusressel/fan2go-tui')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	go mod tidy
	mkdir -p bin/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/fan2go-tui
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 fan2go-tui.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
