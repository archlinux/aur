# Maintainer: tkit <ch1994@outlook.com>
pkgname=transfer-git
pkgver=r78.0d08fb7
pkgrel=1
pkgdesc="Large file transfer tool with multiple file transfer services support"
arch=('any')
url="https://github.com/Mikubill/transfer"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	
	cd $pkgname
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build 
}
package() {
    cd "$pkgname"
	install -Dm755 transfer $pkgdir/usr/bin/transfer
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
