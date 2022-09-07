# Maintainer: ml <ml@visu.li>
pkgname=helm-push
pkgver=0.10.3
pkgrel=1
pkgdesc='Helm plugin to pushing charts to chartmuseum'
arch=('x86_64')
url='https://github.com/chartmuseum/helm-push'
license=('Apache')
install=helm-push.install
depends=('helm')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('eac51a24c14edb990b6483814e43311ef6260fc104cafa83d63d04aae075daf2')

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
