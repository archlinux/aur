# Maintainer: Axel Lehmann <lehmann at cs dot uni-freiburg do de>
pkgname=wharfer
pkgver=v0.5.3
pkgrel=1
pkgdesc='wrapper around docker'
arch=('x86_64')
url="https://github.com/ad-freiburg/wharfer"
license=('APACHE')
depends=('docker')
makedepends=('go-pie' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-X main.version=$(git describe --always --long --dirty) -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/${pkgname}
  chown root:docker "$pkgdir"/usr/bin/${pkgname}
  chmod g+s "$pkgdir"/usr/bin/${pkgname}
}
