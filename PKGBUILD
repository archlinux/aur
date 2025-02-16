# Maintainer: jetexe <aur at jetexe dot net>
# Maintainer: tarampampam <murmur at cats dot rulez>
pkgname=describe-commit-git
pkgver=v0.1.2.r0.gae56af8
pkgrel=2
pkgdesc="CLI tool that leverages AI to generate commit messages based on changes made in a Git repository"
arch=(any)
url="https://github.com/tarampampam/describe-commit"
license=('MIT')
depends=('git')
makedepends=('go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Remove V version prefix
	git describe --long --tags --abbrev=7 | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
	go generate -skip readme ./...
	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s -w -X gh.tarampamp.am/describe-commit/internal/version.version=${pkgver}" \
		-o ./describe-commit \
		./cmd/describe-commit/
}

check() {
	cd "$srcdir/${pkgname}"
	
	./describe-commit --version
}

package() {
	cd "$srcdir/${pkgname}"

	install -Dm755 ./describe-commit -t "$pkgdir"/usr/bin
}

