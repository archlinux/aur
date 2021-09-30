_pkgname="dapr-cli"
pkgname="${_pkgname}-git"
pkgver=541.57bf146
pkgrel=1
epoch=1
pkgdesc="Command-line tools for Dapr. "
arch=('x86_64')
url="https://github.com/dapr/cli"
license=('MIT')
makedepends=('go>=1.1')
checkdepends=('gotestsum')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_gourl="github.com/dapr/cli"
source=("${_pkgname}::git+https://${_gourl}.git")
sha256sums=('SKIP')
install="dapr.install"

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "src/${_gourl}"
	cp -ra "${_pkgname}/." "src/${_gourl}"
}

build() {
	cd "src/${_gourl}"
	GOPATH="$srcdir" make build
}

check() {
	cd "src/${_gourl}"
	GOPATH="$srcdir" make test
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "$srcdir/src/${_gourl}/dist/linux_amd64/release/"* "$pkgdir/usr/bin"
  install -D -m644 "$srcdir/src/${_gourl}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -D -m644 "$srcdir/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
