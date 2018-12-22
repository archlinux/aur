# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=vendorlint-git
pkgver=r13.08816a4
pkgrel=3
pkgdesc="Tool to ensure all dependents are properly vendored"
url="https://github.com/mephux/vendorlint"
arch=('x86_64' 'i686')
license=('Apache')
makedepends=('go' 'go-bindata')
source=("${pkgname}::git+https://github.com/mephux/vendorlint.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/mephux"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/mephux/vendorlint"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	export PATH="$PATH:$GOPATH/bin"

	go get -v -d ./...
}

build() {
	cd "${srcdir}/go/src/github.com/mephux/vendorlint"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	export PATH="$PATH:$GOPATH/bin"

	make
}

package() {
	cd "${srcdir}/go/src/github.com/mephux/vendorlint"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	export PATH="$PATH:$GOPATH/bin"

	install -Dm755 "bin/vendorlint" "${pkgdir}/usr/bin/vendorlint"
}
