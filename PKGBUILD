# Maintainer: ml <ml@visu.li>
pkgname=helm-push
pkgver=0.10.2
pkgrel=1
pkgdesc='Helm plugin to pushing charts to chartmuseum'
arch=('x86_64')
url='https://github.com/chartmuseum/helm-push'
license=('Apache')
install=helm-push.install
depends=('helm')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0e6f22aa0c44a9ad96328c847e140babfc39a8d895e488e5391ee58fe323a4b2')

prepare() { sed -i '/^hooks:$/Q' "$pkgname-$pkgver"/plugin.yaml; }

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -ldflags "-linkmode=external" ./cmd/helm-cm-push
}
# check(): Go tests require special test environment

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 helm-cm-push -t "$pkgdir/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "$pkgdir/usr/lib/helm/plugins/${pkgname##helm-}"
}
