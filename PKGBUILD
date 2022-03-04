pkgname=docker-compose-v2-git
pkgver=r3154.1646411589.c64b044b7
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker, v2, git version"
arch=('any')
url="https://github.com/docker/compose"
license=("Apache")
makedepends=('git' 'go')
checkdepends=('docker')
conflicts=('docker-compose')
provides=('docker-compose')
source=("compose::git+https://github.com/docker/compose.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/compose"
  printf 'r%s.%s.%s\n' \
    "$( git rev-list --count 'HEAD' )" \
    "$( git log --max-count='1' --pretty='format:%ct' )" \
    "$( git rev-parse --short 'HEAD' )"
}

build() {
  cd "${srcdir}/compose"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags=-X=github.com/docker/compose/v2/internal.Version=${pkgver} -mod=readonly -modcacherw"
  CGO_ENABLED=0 go build -trimpath -tags "e2e,kube" -o compose ./cmd
}

check(){
  cd "${srcdir}/compose"
  CGO_ENABLED=0 go test -tags "e2e,kube" -v $(go list -tags "e2e,kube" ./... | grep -vE 'e2e')
}

package() {
  cd "${srcdir}/compose"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 compose "$pkgdir"/usr/lib/docker/cli-plugins/docker-compose
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/docker/cli-plugins/docker-compose "$pkgdir/usr/bin/docker-compose"
}
