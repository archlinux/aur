# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls-git
_name="${pkgname/-git/}"
pkgver=v0.6.0
pkgrel=1
pkgdesc="Extract urls from plain text"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xurls')
provides=('xurls')
makedepends=('git' 'go')
options=('!strip')
source=("${_name}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	git describe --tags | sed 's/-/./g'
}

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/mvdan"
	mv "${_name}" "src/github.com/mvdan/${_name}"
}

build() {
	cd "${srcdir}/src/github.com/mvdan/${_name}/cmd/${_name}"
	GOPATH="${srcdir}" go build
}

package() {
	cd "${srcdir}/src/github.com/mvdan/${_name}"
	install -Dm755 "cmd/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
