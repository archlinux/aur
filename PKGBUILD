# Maintainer: Michael Gisbers <michael@gisbers.de>
# Previous Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mc-agent
pkgver=r62.30e78a7
pkgrel=2
pkgdesc='Simple ssh-agent that loads keys stored from Moolticute'
arch=('x86_64')
url="https://github.com/raoulh/$pkgname"
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname"::"git+https://github.com/raoulh/$pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build 
}

package() {
  cd "$pkgname"
find
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 init/mc-agent.service "$pkgdir"/etc/systemd/user/mc-agent.service

}
