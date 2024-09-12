# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Manuel Romei <manuel.romei@outlook.it>
_name=go-librespot
pkgname="$_name-git"
pkgver=v0.0.17.r35.g9da54b7
pkgrel=1
pkgdesc="Yet another open source Spotify client, written in Go."
arch=(x86_64)
url="https://github.com/devgianlu/go-librespot"
license=('GPL-3.0-only')
groups=()
depends=('libogg' 'libvorbis' 'alsa-lib')
makedepends=('git' 'go')
provides=("$_name=${pkgver}")
conflicts=("$_name")
backup=()
options=()
install=
source=('go-librespot-git::git+https://github.com/devgianlu/go-librespot.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	# Use the most recent annotated tag reachable from the last commit.
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	mkdir -p build/
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$srcdir/$pkgname"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 build/daemon "$pkgdir"/usr/bin/$_name
}
