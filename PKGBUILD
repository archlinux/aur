# Maintainer: Dan Shick <dan.shick@gmail.com>

pkgname=senpai-irc-git
_pkgname=senpai-irc
pkgver=0.3.0.r1.gea86a2e
pkgrel=1
pkgdesc='A modern terminal IRC client'
url=https://git.sr.ht/~delthas/senpai/
arch=(x86_64 aarch64)
license=('ISC')
provides=("senpai-irc")
conflicts=("senpai")
makedepends=('git' 'go' 'scdoc')
source=(
	"${_pkgname}::git+https://git.sr.ht/~delthas/senpai"
)
sha512sums=('SKIP')

pkgver () {
	cd "$_pkgname"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
	cd "${srcdir}/${_pkgname}"
	make clean
}

build () {
	cd "${srcdir}/${_pkgname}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build ./cmd/senpai
	make doc/senpai.1
	make doc/senpai.5
}

package () {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	mkdir -p "${pkgdir}/usr/share/man/man5"
	cp "${srcdir}/${_pkgname}/senpai" "${pkgdir}/usr/bin/senpai"
	cp "${srcdir}/${_pkgname}/doc/senpai.1" "${pkgdir}/usr/share/man/man1/"
	cp "${srcdir}/${_pkgname}/doc/senpai.5" "${pkgdir}/usr/share/man/man5/"
}

