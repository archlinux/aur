# Maintainer: Rafael Rafael <archlinux@rafaelmadriz.com>
pkgname=exir-git
_pkgname=exir
pkgver=r19.9ee920f
pkgrel=1
pkgdesc="Generate a financial report in PDF from a CSV file."
arch=('x86_64')
url="https://github.com/rafamadriz/exir"
license=('Apache-2.0')
makedepends=('git' 'go>=1.25')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')

# https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	export GOPATH="${srcdir}/go"

	cd "${srcdir}/${_pkgname}"
	go mod vendor
	version="${pkgver}" ./build.sh -mod=vendor -trimpath

	# clean now to ensure makepkg --clean works
	go clean -modcache
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./"${_pkgname}"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}
