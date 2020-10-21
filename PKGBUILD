# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite
pkgver=0.2.0
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64')
url='https://github.com/matrix-org/dendrite'
license=('Apache')
makedepends=('git' 'go')
_commit=6a16d46fba9edf82203b2b3606d9a16ed6ef4ae0
source=("git+https://github.com/matrix-org/dendrite.git#commit=$_commit"
        "dendrite.service")
sha256sums=('SKIP'
            '5957e293152b982aacb2fbb7f29e889f7d174dd6a718b28ee69a1b1d368ff125')

prepare(){
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/dendrite-monolith-server
  go build ./cmd/generate-config
  go build ./cmd/generate-keys
}

check() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go test ./cmd/dendrite-monolith-server
}

package() {
  cd "$pkgname"
  install -Dm755 ./dendrite-monolith-server "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 ./generate-config          "$pkgdir/usr/bin/${pkgname}-generate-config"
  install -Dm755 ./generate-keys            "$pkgdir/usr/bin/${pkgname}-generate-keys"
  install -Dm755 "$srcdir/dendrite.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
