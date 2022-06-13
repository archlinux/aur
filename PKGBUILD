# Maintainer: BrLi <brli@chakralinuxlrg>
pkgname=pingu-git
pkgver=0.0.2.r4.0872430
pkgrel=1
pkgdesc="ping command implementation but with pingu ascii art"
arch=(x86_64)
url="https://github.com/sheepla/pingu"
license=('MIT')
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1
	export GOCACHE="$srcdir"/cache
	export GOPATH="$srcdir"/build
	go install
}

package() {
	install -Dm755 build/bin/pingu -t "$pkgdir/usr/bin"
	install -Dm644 ${pkgname%-git}/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
