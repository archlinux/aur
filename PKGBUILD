# Maintainer: ml <ml@visu.li>
_pkgname=helm-diff
pkgname=$_pkgname-cwrau-git
pkgver=r274.52e85fa
pkgrel=0
pkgdesc='Helm plugin that shows a diff explaining what a helm upgrade would change'
arch=('x86_64')
url='https://github.com/cwrau/helm-diff'
license=('Apache')
conflicts=('helm-diff')
depends=('glibc')
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i '/^hooks:$/Q' plugin.yaml
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o bin/diff -ldflags "-linkmode=external -X github.com/databus23/helm-diff/cmd.Version=$pkgver" main.go
}

check() {
  cd "$srcdir/$_pkgname"
  go test -ldflags "-linkmode=external" ./...
}

package() {
  cd "$srcdir/$_pkgname"
  # /usr/lib/helm/plugins is my own choice and not a standard. feedback welcome
  install -Dm755 bin/diff -t "$pkgdir/usr/lib/helm/plugins/${_pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "$pkgdir/usr/lib/helm/plugins/${_pkgname##helm-}"
}
