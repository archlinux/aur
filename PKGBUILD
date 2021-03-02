# Maintainer: Dan Shick <dan.shick@gmail.com>

pkgname=senpai-irc-git
_pkgname=senpai-irc
pkgver=r166.fce8215
pkgrel=1
pkgdesc='TUI IRC Client Created by ~taiite'
url=https://ellidri.org/senpai/
arch=(x86_64)
license=('ISC')
provides=("senpai-irc")
conflicts=("senpai-irc")
makedepends=('git' 'go')
source=(
  "${_pkgname}::git+https://git.sr.ht/~taiite/senpai"
)
sha512sums=('SKIP')

pkgver () {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${srcdir}/${_pkgname}"
	rm -rf build
	mkdir build
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build "./cmd/senpai"
}

package () {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${_pkgname}/build/senpai" "${pkgdir}/usr/bin/senpai-irc"
}

