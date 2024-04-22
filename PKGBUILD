# Maintainer: Fuero <fuerob@gmail.com>

pkgname=pv-migrate
# renovate: datasource=github-releases depName=utkuozdemir/pv-migrate
pkgver=1.8.0
pkgrel=1
pkgdesc='kubectl plugin to easily migrate the contents of one Kubernetes PersistentVolumeClaim to another'
arch=('x86_64')
url=https://github.com/utkuozdemir/pv-migrate
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/${pkgname}-$pkgver.tar.gz")
b2sums=('c1e24a6915a596f645b9e7c9ea5ccfa193d8f6a05631a75a1fa3a0de832da67b7265f58b78b2936745deae59b32c23bf8b569a3aaeacae6e10b05872f398aa75')

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
