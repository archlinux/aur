# Maintainer: Murad Bashirov <carlsonmu@protonmail.com>

pkgname=koneko-git
_pkgname=koneko
pkgver=r17.88e2d6c
pkgrel=1
license=('MIT')
pkgdesc='Koneko is a TUI Client for nyaa.si'
depends=("glibc")
makedepends=("git" "go")
arch=("x86_64")
url="https://github.com/irevenko/koneko"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=("koneko")

# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
pkgver() {
	cd "${srcdir}/${_pkgname}"
	version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "${version:1}"
}

build() {
	export GOPATH="${srcdir}/go"

	cd "${srcdir}/${_pkgname}"
	go mod vendor
	go build
	# clean now to ensure makepkg --clean works
	go clean -modcache
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./koneko

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}
