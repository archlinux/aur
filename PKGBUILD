# Maintainer ringo <ringo@deqc.xyz>
# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver=0.4.105
pkgrel=1
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://github.com/superfly/flyctl"
license=("Apache-2.0")
makedepends=("go" "ruby-rake")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('63ccd9e393a670adc96ad72708180fab23f377259679dff32d92770e0178bb7c2abd33b809656808df41bf306c845385c6c4eaee1c396e4ea54ab7ca66a9fe0d')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION=$pkgver build
}

check() {
  make -C "$pkgname-$pkgver" test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/flyctl" "$pkgdir/usr/bin/flyctl"
  ln -s "/usr/bin/flyctl" "$pkgdir/usr/bin/fly"
}
