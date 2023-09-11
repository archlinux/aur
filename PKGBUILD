# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tctl
pkgver='1.18.0'
pkgrel=2
pkgdesc='Temporal CLI'
arch=('x86_64')
url='https://github.com/temporalio/tctl'
license=('MIT')
depends=('glibc')
makedepends=('go' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('43e94b0dba733395b6c11ce4b7d51cf6ff0d078cdb9b905caff201e45f75237375a4a0ef64fd33cb694e7a65c41037f0ec7a5d0526f2adf28c73fcd439ccb453')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o dist/tctl ./cmd/tctl
  go build -o dist/tctl-authorization-plugin ./cmd/plugins/tctl-authorization-plugin

  ./dist/tctl completion bash > tctl.bash
  ./dist/tctl completion zsh > tctl.zsh
}

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ./dist/tctl -t "${pkgdir}/usr/bin"
  install -Dm755 ./dist/tctl-authorization-plugin -t "${pkgdir}/usr/bin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 tctl.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 tctl.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
