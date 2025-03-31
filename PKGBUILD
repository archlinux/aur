# Maintainer:  nltimv <git at nltimv dot com>
# Contributor: ml <ml@visu.li>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Roman Lisagor <rlisagor at gmail dot com>
_pkgname=calico
pkgname=calicoctl
pkgver=3.29.3
pkgrel=1
pkgdesc='Calico CLI tool'
arch=('x86_64')
url='https://github.com/projectcalico/calico'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('66d49b3af986944e58fede252a2c164251a63f43894181ed7401a6e11dcd8421')

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
