# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=gb
pkgver=0.4.3
pkgrel=1
pkgdesc="The project based build tool for Go"
url="https://github.com/constabulary/${pkgname}"
license=('MIT')
arch=('i686' 'x86_64')
conflicts=()
provides=()
makedepends=('git' 'go')
options=('!strip')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
_cmds="gb gb-vendor"

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/constabulary"
	GOPATH="$PWD" go get -d github.com/pkg/errors
	mv "${pkgname}" "src/github.com/constabulary/${pkgname}"
}

build() {
	cd "${srcdir}/src/github.com/constabulary/${pkgname}"
	for cmd in ${_cmds}; do
		pushd "cmd/${cmd}"
		GOPATH="${srcdir}" go build
		popd
	done
}

package() {
	cd "${srcdir}/src/github.com/constabulary/${pkgname}"
	for cmd in ${_cmds}; do
		install -Dm755 "cmd/${cmd}/${cmd}" "${pkgdir}/usr/bin/${cmd}"
	done
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
