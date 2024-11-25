# Contributor: Bastien 'neitsab' Traverse <neitsab@archlinux.org>
# Contributor: Felix Buehler
# Contributor: zethra <jediben97@gmail.com>

pkgname=primitive-git
pkgver=r152.0373c21
pkgrel=1
pkgdesc="Reproducing images with geometric primitives"
arch=('i686' 'x86_64')
url="https://github.com/fogleman/primitive"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
optdepends=('imagemagick: for GIF output support')
makedepends=('git' 'go')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
    unset GOBIN
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
    go install -v -gcflags "-trimpath $GOPATH/src" "${url#https://}@latest"
}

package() {
    install -Dm755 "$srcdir/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
