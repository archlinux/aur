# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=gb-git
_name="${pkgname/-git/}"
pkgver=v0.4.0.13.g10f5c6c
pkgrel=1
pkgdesc="The project based build tool for Go"
url="https://github.com/constabulary/${_name}"
license=('MIT')
arch=('i686' 'x86_64')
conflicts=()
provides=('gb')
makedepends=('git' 'go')
options=('!strip')
source=("${_name}::git+${url}")
sha256sums=('SKIP')
_cmds="gb gb-vendor"

pkgver() {
	cd "../${_name}"
	git describe --always --tags | sed 's/-/./g'
}

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/constabulary"
	mv "${_name}" "src/github.com/constabulary/${_name}"
}

build() {
	cd "${srcdir}/src/github.com/constabulary/${_name}"
	for cmd in ${_cmds}; do
		pushd "cmd/${cmd}"
		GOPATH="${srcdir}" go build
		popd
	done
}

package() {
	cd "${srcdir}/src/github.com/constabulary/${_name}"
	for cmd in ${_cmds}; do
		install -Dm755 "cmd/${cmd}/${cmd}" "${pkgdir}/usr/bin/${cmd}"
	done
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
