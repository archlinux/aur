# Maintainer:  nltimv <git at nltimv dot com>
# Contributor: ml <ml@visu.li>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Roman Lisagor <rlisagor at gmail dot com>
_pkgname=calico
pkgname=calicoctl
pkgver=3.27.0
pkgrel=1
pkgdesc='Calico CLI tool'
arch=('x86_64')
url='https://github.com/projectcalico/calico'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('2a4b5132035dfd6ac4abc8d545f33de139350eca523e0c5cfe4ac32e43fcb2f1')

build() {
  _x=(
    commands.GIT_REVISION="$(bsdcat "$_pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
    commands.VERSION="$pkgver"
    commands/common.VERSION="$pkgver"
  )
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  mkdir -p build
  go build -o build/ -ldflags="-linkmode=external ${_x[*]/#/-X=github.com/projectcalico/calico/calicoctl/calicoctl/}" \
    ./calicoctl/calicoctl
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/calicoctl "$pkgdir"/usr/bin/calicoctl
}
