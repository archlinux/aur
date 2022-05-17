# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=antidot
pkgname=${_pkgname}-git
pkgver=v0.6.2.r50.g3abc66f
pkgrel=1
pkgdesc='Cleans up your $HOME from those pesky dotfiles'
arch=('x86_64')
url="https://github.com/doron-cohen/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+https://github.com/doron-cohen/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags --exclude latest | sed 's/^gittyup_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	mkdir -p build/
}

build() {
	cd "${pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

package() {
	cd "${pkgname}"
	install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
