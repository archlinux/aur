# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Robin Broda <coderobe @ archlinux.org>

pkgname=nebula-git
pkgver=1.4.0.r0.g2e1d674
pkgrel=1
pkgdesc='A scalable overlay networking tool with a focus on performance, simplicity and security'
arch=('x86_64')
url='https://github.com/slackhq/nebula'
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# Keep downloaded dependencies inside srcdir
GOFLAGS=-mod=vendor

pkgver() {
  cd $pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  sed -i -e "s|/usr/local/bin|/usr/bin|g" examples/service_scripts/nebula.service
}

build() {
  cd $pkgname

  # Keep downloaded dependencies inside srcdir
  GOPATH="$srcdir/build"
  mkdir -p "$GOPATH"
  go mod vendor

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  for cmd in nebula{,-cert,-service}; do
    go build -ldflags "-X main.Build=$pkgver" -o $cmd ./cmd/$cmd
  done
}

check() {
  cd $pkgname

  go test -v ./...
}

package() {
  cd $pkgname

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 examples/config.yml "$pkgdir/etc/nebula/config.yml.example"
  #install -Dm644 dist/arch/nebula.service "$pkgdir/usr/lib/systemd/system/nebula.service"
  install -Dm644 examples/service_scripts/nebula.service "$pkgdir/usr/lib/systemd/system/nebula.service"
  for cmd in nebula{,-cert,-service}; do
    install -Dm755 $cmd "$pkgdir/usr/bin/$cmd"
  done
}
