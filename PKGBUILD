# Maintainer: ml <>
pkgname=golang-mockery
pkgver=2.16.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7582dfdf75f0153d8ab98e299c99cc80e98c71aeb222a0097eb8e5af5da0d32e')

build() {
  cd mockery-"$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o mockery -ldflags "-linkmode=external -X github.com/vektra/mockery/v2/pkg/config.SemVer=v$pkgver" main.go

  for i in bash zsh fish; do
    # --config=/dev/null to avoid reading .mockery.yaml
    ./mockery --config=/dev/null completion "$i" >completion."$i"
  done
}

package() {
  cd mockery-"$pkgver"
  install -Dm755 mockery -t "$pkgdir"/usr/bin
  install -Dm755 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/mockery
  install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_mockery
  install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/mockery.fish
}
