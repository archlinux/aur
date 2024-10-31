# Maintainer: Zacharias Knudsen <z@chari.as>
pkgname=puma-dev-git
pkgver=0.18.3.r0.gdb9ec15
pkgrel=1
pkgdesc="A tool to manage rack apps in development with puma"
arch=('x86_64')
url="https://github.com/puma/puma-dev"
license=('BSD-3-Clause')
depends=('authbind')
conflicts=('puma-dev')
makedepends=('git' 'go')
provides=('puma-dev')
install=puma-dev-git.install
source=("$pkgname::git+$url"
        'user.service')
md5sums=('SKIP'
         '308627b449810f382900a2e2d263862e')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname"
  install -Dm755 build/puma-dev "$pkgdir"/usr/bin/puma-dev

  install -Dm644 "$srcdir"/user.service "$pkgdir"/usr/lib/systemd/user/puma-dev.service
}
