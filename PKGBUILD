# Maintainer: Vidhu Kant Sharma <vidhukant@vidhukant.com>

pkgname=macli-git
_pkgname=macli
pkgver=1.1.0.r0.g1d72b87
pkgrel=1
license=('GPLv3')
pkgdesc='Unofficial CLI-Based MyAnimeList Client'
makedepends=("git" "go>=1.6")
depends=("gnome-keyring")
arch=("i686" "x86_64")
_gourl='dev.vidhukant.xyz/macli'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=("macli")
conflicts=("macli")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	version=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
	echo "${version:1}"
}

build() {
	export GOPATH="${srcdir}/go"

	cd "${srcdir}/${_pkgname}"
	go mod vendor
	go build .

  go clean -modcache
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./macli

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}
