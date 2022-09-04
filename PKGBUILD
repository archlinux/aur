# Maintainer: fuero <fuerob@gmail.com>
pkgname=timew-sync-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Timewarrior Sync Server"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/timewarrior-synchronize/timew-sync-server"
license=('MIT')
depends=()
optdepends=()
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('939e81a1f2cc26fad89c92ee4f8b50da98647b84d8dc5e135536968bcd8f4a9c3b14ad1b7e151b9ffbc01360324d3cd615fb5ec6e91b7b643908395dd6e428f1')

# With pacman 6 arriving a rebuild of yay will be necessary, if you upgrade pacman without upgrading yay at the same time, yay will not run after.
# I'm bumping the pkgrel so it shows up on the upgrade list (and will do so when pacman transitions from staging->core)
# In case you end up with a non-functioning yay after the upgrade follow the
# instructions on the github page

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -x -v -ldflags=-linkmode=external"

  cd "$srcdir/$pkgname-$pkgver"
  go build -o build/${pkgname}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 0755 build/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
