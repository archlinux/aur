# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gotop-git
_pkgname=${pkgname%-git}
pkgver=3.0.0.r43.g2cd92e1
pkgrel=2
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64)
url='https://github.com/cjbassi/gotop'
license=(AGPL3)
makedepends=("go" "git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/cjbassi/gotop")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-mod vendor \
		.
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "gotop" "${pkgdir}/usr/bin/gotop"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
