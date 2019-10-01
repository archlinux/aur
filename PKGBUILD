# Maintainer: Axel Lehmann <lehmann at cs dot uni-freiburg do de>
pkgname=wharfer-git
pkgver=v0.5.3.r0.ge30c81f
pkgrel=1
pkgdesc='wrapper around docker'
arch=('x86_64')
url="https://github.com/ad-freiburg/wharfer"
license=('APACHE')
depends=('docker')
makedepends=('go-pie' 'git')
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
    -ldflags "-X main.version=$(git describe --always --long --dirty) -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/${pkgname%-git}
  chown root:docker "$pkgdir"/usr/bin/${pkgname%-git}
  chmod g+s "$pkgdir"/usr/bin/${pkgname%-git}
}
