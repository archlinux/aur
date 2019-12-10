# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Robin Broda <coderobe @ archlinux.org>

pkgname=nebula-git
pkgver=1.0.0.r40.g76f66b8
pkgrel=1
pkgdesc='A scalable overlay networking tool with a focus on performance, simplicity and security'
arch=('x86_64')
url='https://github.com/slackhq/nebula'
license=('MIT')
depends=()
makedepends=('git' 'go-pie')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  GOPATH="$srcdir/build" go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS -X main.Build=$(date -u '+%Y%m%d%H%M%S' -d @${SOURCE_DATE_EPOCH})" \
    -o ./nebula ./cmd/nebula

  GOPATH="$srcdir/build" go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS -X main.Build=$(date -u '+%Y%m%d%H%M%S' -d @${SOURCE_DATE_EPOCH})" \
    -o ./nebula-cert ./cmd/nebula-cert
}

#check() {
#  cd $pkgname
#
#  GOPATH="$srcdir/build" go test -v ./...
#}

package() {
  cd $pkgname

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 examples/config.yml "$pkgdir/etc/nebula/config.yml.example"
  install -Dm644 examples/service_scripts/nebula.service "$pkgdir//usr/lib/systemd/system/nebula.service"
  install -Dm755 nebula "$pkgdir/usr/bin/nebula"
  install -Dm755 nebula-cert "$pkgdir/usr/bin/nebula-cert"
}
