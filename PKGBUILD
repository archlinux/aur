# Maintainer: Axel Lehmann <lehmann at cs dot uni-freiburg do de>
pkgname=gantry-git
pkgver=v0.2.0.r3.gf314e46
pkgrel=1
pkgdesc='Pipeline management tool using containers as its building blocks'
arch=('x86_64')
url="https://github.com/ad-freiburg/gantry"
license=('APACHE')
depends=('docker')
makedepends=('go-pie' 'git')
optdepends=('wharfer: wrapper around docker')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-X github.com/ad-freiburg/gantry.Version=$(git describe --always --long --dirty) -extldflags $LDFLAGS" \
    -o $pkgname cmd/gantry/gantry.go
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/${pkgname%-git}
}
