# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: ml <>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Sebastian Krebs <sebastian@krebs.one>
pkgname=kaniko
pkgver=1.25.18
pkgrel=1
pkgdesc='Build Container Images In Kubernetes'
arch=('x86_64')
url='https://github.com/chainguard-forks/kaniko'
license=('Apache')
depends=('glibc')
optdepends=('bash: run_in_docker.sh script')
makedepends=('go')
options=(!lto)
source=("https://github.com/chainguard-forks/kaniko/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94d925a73b1da11c46a6feafb6870d05dcbffb5d014d111b149f3fb51722c037')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -mod=vendor -modcacherw'
  export GOOS=linux
  export GOARCH=$arch
  case $arch in
  x86_64)
    export GOARCH=amd64
    ;;
  esac
  go build -trimpath -o . -ldflags="-linkmode=external -X=github.com/chainguard-forks/kaniko/pkg/version.version=v$pkgver" ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  # custom umask values make tests fail. set to default
  umask 0022
  go test -short ./pkg/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 executor warmer -t "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  ln -sT /usr/lib/"$pkgname"/executor "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs examples deploy run_in_docker.sh -t "$pkgdir/usr/share/doc/$pkgname"
}
