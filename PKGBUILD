# Maintainer: ml <ml@visu.li>
pkgname=helm-edit
pkgver=0.5.0
pkgrel=1
pkgdesc='Helm plugin to edit releases'
arch=('x86_64')
url='https://github.com/mstrzele/helm-edit'
license=('MIT')
install=helm-edit.install
depends=('bash' 'helm')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('60d13996dc075310f8f4bcd9641ddacc9d3facbb14176fa3e6ceb25a8ce6d1c1')

prepare() {
  sed -i '/^hooks:$/Q' "$pkgname-$pkgver"/plugin.yaml
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 helm-edit plugin.complete -t "$pkgdir"/usr/lib/helm/plugins/edit
  install -m644 plugin.yaml -t "$pkgdir"/usr/lib/helm/plugins/edit
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
