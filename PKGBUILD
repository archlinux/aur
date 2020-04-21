# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gotop-git
_pkgname=${pkgname%-git}
pkgver=3.5.1.r4.g84ec9e4
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64)
url='https://github.com/xxxserxxx/gotop'
license=(AGPL3)
makedepends=("go" "git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/xxxserxxx/gotop")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
	release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')

	echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}

build() {
	cd "${srcdir}/${pkgname}"

	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		./cmd/gotop
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "gotop" "${pkgdir}/usr/bin/gotop"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
