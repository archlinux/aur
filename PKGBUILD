# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: iboyperson <tjquillan at gmail dot com>
pkgname=tldr++
_pkgver=1.0.0-alpha
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Community driven man pages improved with smart user interaction"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://isacikgoz.me/tldr"
license=('MIT')
makedepends=('go')
provides=("${pkgname%++}")
conflicts=("${pkgname%++}" 'nodejs-tldr' 'tldr-bash-git' 'tealdeer' 'tldr-cpp-client' 'tldr-python-client')
source=("$pkgname-$_pkgver.tar.gz"::"https://github.com/isacikgoz/tldr/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('d40e1c602d84acc67cdee3b9bed001fb8ec198c7049c1d05eb071ab05af66c19')

prepare() {
	export GOPATH="$srcdir/gopath"
	go clean -modcache
}

build() {
	cd "${pkgname%++}-$_pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v ./cmd/...

	# Clean mod cache for makepkg -C
	go clean -modcache
}

package() {
	cd "${pkgname%++}-$_pkgver"
	install -Dm755 "${pkgname%++}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
