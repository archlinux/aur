# Maintainer: SZanko, szanko at protonmail dot com
# Maintainer: Niko <aurpkgs@niko.lgbt>
pkgname=rimgo
pkgver=1.4.2
pkgrel=4
pkgdesc="An alternative frontend for Imgur."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://codeberg.org/rimgo/rimgo"
options=(!lto)
license=('AGPL3')
makedepends=('go>=1.17')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"rimgo.service"
	"rimgo.conf"
)
sha256sums=('6834d252e7c9c63e313c29e0a4d411d5c201fbb539186619e1995462bcae658b'
            '2fa11fe14e1536f63f678f3334d33910c38cd67c28a4a6c94fcab9ca908197d6'
            '145cd73c55a7bc133db7e981c1485d614fadb96a49680e0bd1320f25dc28fd93')
backup=(
  'etc/rimgo.conf'
)

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"
  go mod vendor
  go build
  go clean -modcache
}

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}/rimgo"	-t "${pkgdir}/usr/bin"
  install -Dm644 "${pkgname}/LICENSE"	-t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgname}/README.md"	-t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "rimgo.service"	-t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "rimgo.conf"		-t "${pkgdir}/etc/"
}
