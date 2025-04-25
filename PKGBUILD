# Maintainer: Fuero <fuerob@gmail.com>

pkgname=pv-migrate
# renovate: datasource=github-releases depName=utkuozdemir/pv-migrate
pkgver=2.2.1
pkgrel=1
pkgdesc='kubectl plugin to easily migrate the contents of one Kubernetes PersistentVolumeClaim to another'
arch=('x86_64')
url=https://github.com/utkuozdemir/pv-migrate
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/${pkgname}-$pkgver.tar.gz")
b2sums=('815c58c403187881011bff0620edc2994572ef4d0e2824039594155e2f01610405af3a7cba3a24bc11f2601bef9f68e847d4584826b7e93f875c3cc1016f98e2')

prepare() {
  cd $pkgname-$pkgver
  go mod vendor
}

build() {
  cd $pkgname-$pkgver
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  mkdir bin
  go build -o bin ./...
}

check() {
  cd $pkgname-$pkgver
  go test ./...
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/bash-completion/completions
  bin/${pkgname} completion bash > "$pkgdir"/usr/share/bash-completion/completions/${pkgname}
  install -d "$pkgdir"/usr/share/zsh/site-functions
  bin/${pkgname} completion zsh > "$pkgdir"/usr/share/zsh/site-functions/_${pkgname}
  install -Dt "$pkgdir"/usr/bin bin/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  for i in *.md
  do
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname $i
  done
}

# vim:set ts=2 sw=2 et:
