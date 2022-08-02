# Maintainer: SZanko, szanko at protonmail dot com
pkgname=rimgo
rpkgver=2022-04-22
pkgver=2022.04.22
pkgrel=3
pkgdesc="An alternative frontend for Imgur. Originally based on rimgu."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://codeberg.org/video-prize-ranch/rimgo"
options=(!lto)
license=('AGPL3')
provides=("${pkgname}")
makedepends=('go>=1.17')
source=("${pkgname}-${rpkgver}.tar.gz::${url}/archive/${rpkgver}.tar.gz")
sha256sums=('d332f65e988247ee274a03de23bd86930fd4b2111d20ce01399c97c85d257241')
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
  cd "$srcdir/$pkgname"
  install -Dm755 -t "${pkgdir}/usr/bin" rimgo
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ../../rimgo.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 ../../rimgo.conf -t "$pkgdir/etc/"
}
