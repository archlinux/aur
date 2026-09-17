# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=slopquota
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI utility for viewing token quotas from AI providers"
arch=('x86_64')
url="https://gitlab.com/nathanchere/slopquota"
license=('LicenseRef-Unknown')
depends=('glibc')
makedepends=('git' 'go')
_commit=82f774828f04df5b69ca963e41ebcd2a83dee7f3
source=("${pkgname}::git+https://gitlab.com/nathanchere/slopquota.git#commit=${_commit}")
sha256sums=('3a8ef2b36b4177dda5891e4ae931ec2b36c0e4fea3d6e59d4d0574ee6de182e3')

prepare() {
	cd "$srcdir/$pkgname/src"
	go mod download
}

build() {
	cd "$srcdir/$pkgname/src"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	mkdir -p "$srcdir/bin"
	go build -ldflags="-linkmode=external" -o "$srcdir/bin/$pkgname" ./slopquota
}

check() {
	cd "$srcdir/$pkgname/src"
	go test ./...
}

package() {
	install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
