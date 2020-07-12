# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=ghz-git
pkgver=0.55.0.r4.g02c0138
pkgrel=2
pkgdesc="Simple gRPC benchmarking and load testing tool"
arch=('x86_64')
url="https://ghz.sh/"
license=('Apache')
makedepends=('go')
source=('git+https://github.com/bojand/ghz')
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/${pkgname%-git}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v\(.*\)/\1/' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}

prepare() {
	cd "${pkgname%-git}"
	mkdir -p build
}

build() {
	cd "${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} -s -w"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v -o build ./cmd/...
	#make build
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 build/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
	install -Dm755 build/${pkgname%-git}-web "$pkgdir"/usr/bin/${pkgname%-git}-web
}
