# Maintainer: Jake Bailey <pkgbuilds at jakebailey dot dev>

pkgname=go-perflock-git
_pkgname=perflock
pkgver=r17.b67f3f2
pkgrel=1
pkgdesc="Locking wrapper for running benchmarks on shared hosts"
arch=('any')
url="https://github.com/aclements/perflock"
license=('BSD-3-Clause')
depends=()
makedepends=('git' 'go')
optdepends=()
source=("git+$url.git")
md5sums=('SKIP')
conflicts=(perflock-git)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o perflock -v ./cmd/perflock
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 perflock "$pkgdir"/usr/bin/perflock
	install -Dm644 init/systemd/perflock.service "$pkgdir"/etc/systemd/system/perflock.service
}
