# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=offmap-git
_pkgname=offmap
pkgver=r1.28b36df
pkgrel=1
pkgdesc='A maildir downloader using IMAP extensions to be ahead of the competition'
arch=('x86_64' 'arm64')
url="https://git.sr.ht/~rockorager/offmap"
license=('MIT')
provides=("${_pkgname}")
conflict=("offmap")
makedepends=('git' 'go' 'scdoc')
optdepends=()
source=(
	"git+$url"
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	(
		set -o pipefail;
		git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare(){
	cd "${srcdir}/${_pkgname}"
	go mod download
}

build() {
	cd "${srcdir}/${_pkgname}"
	make all
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install "DESTDIR=${pkgdir}"
}
