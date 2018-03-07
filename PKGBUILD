# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=vendorlint-git
pkgver=r13.08816a4
pkgrel=1
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
	cd "${srcdir}"

	mkdir -p "go/src/github.com/mephux"
	ln -sf "${srcdir}/${pkgname}" "go/src/github.com/mephux/vendorlint"
}

build() {
	cd "${srcdir}/go/src/github.com/mephux/vendorlint"
	mkdir bin

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go get -v -d ./...
	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go build -o bin/vendorlint github.com/mephux/vendorlint
}

package() {
	cd "${srcdir}/go/src/github.com/mephux/vendorlint"

	install -Dm755 "bin/vendorlint" "${pkgdir}/usr/bin/vendorlint"
}
