# Maintainer: Slavi Pantaleev <slavi at devture dot com>

pkgname=agru
pkgver=0.2.1
pkgrel=0
pkgdesc="Ansible-Galaxy Requirements Updater - a fast ansible-galaxy replacement"
arch=('any')
url="https://github.com/etkecc/agru"
license=('GPL3')
depends=()
makedepends=('git' 'go')
source=('vcs-repository::git+https://github.com/etkecc/agru#tag=v'$pkgver)
md5sums=('SKIP')

build() {
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$srcdir/vcs-repository"

	# Build the package path (not main.go) with VCS stamping enabled,
	# so `agru -version` can report the version from the embedded build info.
	# The binary goes outside the checkout to keep the git tree clean,
	# otherwise rebuilds get stamped as "+dirty".
	go build -v -buildvcs=true -o "$srcdir/agru" ./cmd/agru
}

package() {
	install -Dm 755 "$srcdir/agru" "$pkgdir/usr/bin/agru"
}
