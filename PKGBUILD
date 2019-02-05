# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gomuks-git
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.r280
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686)
depends=(glibc)
makedepends=(go-pie git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

prepare () {
	cd "${pkgname}"

	# The Go modules index has some replacements to use locally checked
	# out modules; so remove those to make sure "go build" below will
	# ensure that the correct version is always fetched.
	sed -i -e '/^replace\s/d' go.mod
}

pkgver () {
	cd "${pkgname}"
    echo "0.r$(git rev-list --count HEAD)"
}

build () {
	cd "${pkgname}"
	local curdir=$(pwd)
	go build \
		-gcflags "all=-trimpath=${curdir}" \
		-asmflags "all=-trimpath=${curdir}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		.
}

package () {
	cd "${pkgname}"
	install -Dm755 gomuks "${pkgdir}/usr/bin/gomuks"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
