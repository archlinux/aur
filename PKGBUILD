# Maintainer: Rick <riyyi3 at gmail dot com>

pkgname="declpac-git"
_pkgname="declpac"
pkgver=r52.b1a376d
pkgrel=1
pkgdesc="Declarative package utility for pacman written in go."
arch=('x86_64' 'aarch64')
url="https://github.com/Riyyi/declpac"
license=('GPL-3.0-only')
depends=(
	'pacman>6.1'
	'git'
)
optdepends=()
makedepends=('go>=1.21')
options=(!lto)
conflicts=()
provides=('declpac')
source=("declpac::git+https://github.com/Riyyi/declpac.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}" || exit 1
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1

	cd "$srcdir/$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
	chmod -R u+w "$srcdir"/gopath # allow proper cleanup
}

package() {
	cd "$srcdir/$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
