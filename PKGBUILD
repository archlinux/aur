# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/fan2go-tui/tree/main/packaging/aur/fan2go-tui-git
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=fan2go-tui-git
pkgver=0.5.0.r0.gf915e5b
pkgrel=1
pkgdesc="Terminal UI for fan2go."
arch=('x86_64')
url="https://github.com/markusressel/fan2go-tui"
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git' 'just')
provides=("fan2go-tui")
conflicts=("fan2go-tui")
install=fan2go-tui.install
source=('git+https://github.com/markusressel/fan2go-tui')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	go mod download
	mkdir -p bin/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	just VERSION="${pkgver}" build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/fan2go-tui
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 fan2go-tui.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
