# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-git
pkgver=0.4.0.r6.ga9d20c6
pkgrel=1
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64')
url='https://github.com/beatlabs/ergo'
license=('BSD-3-Clause')
provides=('ergo')
makedepends=('go' 'git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ergo"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/ergo"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/ergo/cmd/cli"
  go build -mod=mod -v -o "${srcdir}/ergo-bin"
}

package() {
  cd "${srcdir}/ergo"
  install -Dm755 "${srcdir}"/ergo-bin "${pkgdir}/usr/bin/ergo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ergo/LICENSE"
  go clean -modcache #Remove go libraries
}