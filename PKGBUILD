# Maintainer: ml <>
pkgname=golang-mockery
pkgver=2.14.1
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8e0f27a3f1f7f826849950746b97da320d8c82d5cfaf775a4da7e9113d1c40d2')

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
