# Maintainer: Jack O'Sullivan <j@ckos.ie>

pkgname=netsoc
pkgdesc="Netsoc CLI"
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url="https://netsoc.ie"
license=('GPL-3')
depends=('glibc')
makedepends=('go' 'rsync' 'git')
source=(https://github.com/netsoc/cli/archive/v${pkgver}/v${pkgver}.tar.gz)
sha512sums=('e02cac7167a061a88ec602e852c1fb57afd4161c2ca8122aa73c0f8b4633afbdb6c44b66728fc715370c3cd2fb1912213bf20b260f04ff69f406c67f0424ce55')

build() {
  cd cli-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
  export GOLDFLAGS="-linkmode=external"

  make VERSION="$pkgver" bin/netsoc
}

package() {
  cd cli-${pkgver}
  install -Dm755 bin/netsoc -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/netsoc" docs -t man -o docs/
  gzip docs/man1/*
  install -Dm644 docs/man1/* -t "$pkgdir/usr/share/man/man1"

  "$pkgdir/usr/bin/netsoc" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/netsoc"
  "$pkgdir/usr/bin/netsoc" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_netsoc"
}

# vim: ts=2 sw=2 et:
