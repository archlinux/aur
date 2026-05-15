# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=rescached
pkgver=4.6.0
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://git.sr.ht/~shulhan/rescached"
license=('GPL-3.0-only')

depends=('glibc')
makedepends=('git' 'go>=1.20')

source=(
  "$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('544da1e5844ba1ff1cfd532cb4ce115ac58916ce87941f5b0ab7496da232a706')

backup=(
  'etc/rescached/block.d/.pgl.yoyo.org'
  'etc/rescached/block.d/.someonewhocares.org'
  'etc/rescached/block.d/.winhelp2002.mvps.org'
  'etc/rescached/rescached.cfg'
  'etc/rescached/localhost.pem'
  'etc/rescached/localhost.pem.key'
)

prepare() {
  cd "$pkgname-v$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX="$pkgdir" install
  rm -rf ${pkgdir}/usr/share/rescached/
  install -Dm644 LICENSES/GPL-3.0-only.txt "${pkgdir}/usr/share/licenses/rescached/GPL-3.0-only.txt"
}
