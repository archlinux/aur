# Maintainer: aksr <aksr at t-com dot me>
pkgname=dupl-git
pkgver=r119.8836f5c
pkgrel=1
pkgdesc='A tool for code clone detection.'
arch=('i686' 'x86_64')
url='https://github.com/mibk/dupl'
license=('MIT')
makedepends=('git' 'go')
conflicts=("${pkgname%-*}")
replaces=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/mibk/dupl")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	go build \
		-o "${_binname}" \
		-trimpath \
		-buildmode='pie' \
		-mod='readonly' \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 dupl "$pkgdir/usr/bin/dupl"
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
