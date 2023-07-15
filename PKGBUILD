# Maintainer: éclairevoyant
# Contributor: aksr <aksr at t-com dot me>

_pkgname=kana
pkgname="$_pkgname-git"
pkgver=r6.3eb1e80
pkgrel=3
pkgdesc="Command to transliterate hiragana and katakana to ASCII"
arch=(i686 x86_64)
url="https://github.com/robpike/$_pkgname"
license=(BSD)
depends=(glibc)
makedepends=(git go)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	go mod init "${url#https://}"
	go mod tidy
}

build() {
	cd $_pkgname
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd $_pkgname
	install -vDm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vDm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}
