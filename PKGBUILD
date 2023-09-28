# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: ml <>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Sebastian Krebs <sebastian@krebs.one>
pkgname=kaniko
pkgver=1.16.0
pkgrel=1
pkgdesc='Build Container Images In Kubernetes'
arch=('x86_64')
url='https://github.com/GoogleContainerTools/kaniko'
license=('Apache')
depends=('glibc')
optdepends=('bash: run_in_docker.sh script')
makedepends=('go')
options=(!lto)
source=("https://github.com/GoogleContainerTools/kaniko/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5aabcc5d50e31408a0fb524ebbf3e8076ff875e8f080ac1be9acf920c2208ae4')

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
  go build -trimpath -o . -ldflags="-linkmode=external -X=github.com/GoogleContainerTools/kaniko/pkg/version.version=v$pkgver" ./cmd/...
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
