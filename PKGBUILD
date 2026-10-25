# Maintainer: Landon Kuehner <Landon.kuehner@proton.me>

pkgname=yggmail-git
_pkgname=yggmail
pkgver=r121.727c60d
pkgrel=1
pkgdesc="End-to-end encrypted email for the mesh networking age"
arch=('x86_64')
url="https://github.com/neilalexander/${_pkgname}"
license=('MPL-2.0')

depends=(glibc)
makedepends=('git' 'go')

provides=('yggmail')
conflicts=('yggmail')

source=("$_pkgname::git+https://github.com/neilalexander/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	export GOPATH="${srcdir}/.go"
	go mod download -modcacherw
}

build() {
	cd "${srcdir}/${_pkgname}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build \
    	-trimpath \
    	-buildmode=pie \
    	-mod=readonly \
    	-modcacherw \
    	-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		"./cmd/${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" ${_pkgname}
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
