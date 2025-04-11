# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=ovf-export-git
pkgver=r8.02f09ad
pkgrel=1
pkgdesc="OVF/OVA export tool for libvirt"
arch=('x86_64')
url="https://gitlab.com/Enrico204/ovf-export"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
depends=(qemu-img tar)
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
    go install -v -gcflags "-trimpath $GOPATH/src" "${url#https://}/cmd/${pkgname%-git}@latest"
}

package() {
    install -Dm755 "$srcdir/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
