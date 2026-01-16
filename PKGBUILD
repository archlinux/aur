# Maintainer: Dan Shick <dan.shick@gmail.com>

pkgname=senpai-git
_pkgname=senpai
pkgver=0.4.1.r31.gd893048
pkgrel=1
pkgdesc='A modern terminal IRC client'
arch=(x86_64 aarch64)
url=https://git.sr.ht/~delthas/senpai/
license=('ISC')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!lto')
replaces=("senpai-irc-git")
conflicts=("senpai")
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
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		\"-ldflags=-compressdwarf=false -linkmode external\" \
		-trimpath"
	export GOPATH="${srcdir}"

	printf "GOFLAGS: %s\n" "${GOFLAGS}";
	go build ./cmd/senpai
	make doc/senpai.{1,5}
}

check() {
  cd "${srcdir}/${_pkgname}"

  go test -v ./...
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
