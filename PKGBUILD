# Maintainer: Jack O'Sullivan <j@ckos.ie>

pkgname=netsoc
pkgdesc="Netsoc CLI"
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
url="https://netsoc.ie"
license=('GPL-3')
depends=('glibc')
makedepends=('go' 'rsync' 'git')
source=(https://github.com/netsoc/cli/archive/v${pkgver}/v${pkgver}.tar.gz)
sha512sums=('17533c6e53ac63bfda599f13acdcb11593339175dd04a1b855f6969334b6ec0d77b76665e8851ca5fca5c427903588137cf8ca3b3b4483e35d0ed364e4b72b3d')

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
