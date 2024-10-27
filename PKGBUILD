# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="communique"
pkgver="0.0.1"
pkgrel=1
pkgdesc='A TUI instant messaging client compatible with the Jabber network and XMPP.'
url="https://codeberg.org/mellium/communique-tui/"
license=('BSD-2-Clause')
arch=('x86_64')
makedepends=(
	'go'
	'make'
)
install=".install"
source=("${pkgname}_v${pkgver}.zip::https://codeberg.org/mellium/communique-tui/archive/v${pkgver}.zip")
sha256sums=('250efeafa34597fd430fce6efc46bfda6f669415960f00d526d4df69bbe9f237')

build() {
	cd ${pkgname}-tui || exit
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make VERSION="v${pkgver}-arch${pkgrel}"
}

check() {
	cd ${pkgname}-tui || exit
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go test ./...
}

package() {
    cd ${pkgname}-tui || exit
		make DESTDIR="$pkgdir" PREFIX=/usr install
		install -Dm644 communiqué.toml.example "${pkgdir}/usr/share/factory/etc/communiqué/communiqué.toml"
		install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
