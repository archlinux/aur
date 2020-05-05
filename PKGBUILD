# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=kubernetes-helm2
pkgver=2.16.7
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/helm/helm"
makedepends=('git' 'glide' 'go')
depends=('kubectl' 'socat')
install="kubernetes-helm2.install"
license=('Apache')
source=("git+https://github.com/helm/helm#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/src/k8s.io"
  mv -T "$srcdir/helm" "$srcdir/src/k8s.io/helm"
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/k8s.io/helm"
  export CGO_LDFLAGS="$LDFLAGS"
  make bootstrap
  make GOFLAGS="-buildmode=pie -trimpath" build
}

package() {
  install -Dm755 "$srcdir/src/k8s.io/helm/bin/helm" "$pkgdir/usr/bin/helm2"
  install -Dm755 "$srcdir/src/k8s.io/helm/bin/tiller" -t "$pkgdir/usr/bin"
}
