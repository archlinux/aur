pkgname=commitlint-go-git
_pkgname=commitlint
pkgver=main.0e81782467e3e6f5980e7bdb060693d6ad1d4d35
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/jurienhamaker/commitlint'
source=('git+git://github.com/jurienhamaker/commitlint')
depends=('git')
makedepends=('go')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$_pkgname"
	GO111MODULE=on go build ./cmd/commitlint -o "$srcdir/bin/commitlint" -ldflags "-s -w -X=main.Version=$pkgver -X=main.CommitSHA=$(git rev-parse HEAD)"
}

package() {
	cd "$srcdir/bin"
	install -Dm755 'commitlint' "$pkgdir/usr/bin/commitlint"
}
