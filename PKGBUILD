# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=netcap-git
pkgver=r74.9067552
pkgrel=1
epoch=1
pkgdesc='A framework for secure and scalable network traffic analysis'
url=https://github.com/dreadl0ck/netcap
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'go')
conflicts=('netcap')
provides=('netcap')
source=("${pkgname}::git+https://github.com/dreadl0ck/netcap.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/dreadl0ck/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/dreadl0ck/netcap"
}

build() {
	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
  go get -v ./...
  go build -ldflags "-s -w" -o netcapture -i github.com/dreadl0ck/netcap/cmd
}

package() {
	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	install -Dm755 netcapture "${pkgdir}/usr/bin/netcapture"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
