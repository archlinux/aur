# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-git
pkgver=0.4.0.r6.ga9d20c6
pkgrel=1
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64')
url='https://github.com/beatlabs/ergo'
license=('BSD')
provides=('ergo')
depends=('glibc')
makedepends=('go' 'git')
source=("ergo::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ergo"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/ergo"
  mkdir -p build/
}

build() {
  cd "${srcdir}/ergo"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "${srcdir}/ergo"
  install -Dm755 build/cli "${pkgdir}/usr/bin/ergo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}