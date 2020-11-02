# Maintainer: Jack O'Sullivan <j@ckos.ie>

pkgname=netsoc
pkgdesc="Netsoc CLI"
pkgver=0.3.7
pkgrel=1
arch=('x86_64')
url="https://netsoc.ie"
license=('GPL-3')
depends=('glibc')
makedepends=('go' 'rsync' 'git')
source=(https://github.com/netsoc/cli/archive/v${pkgver}/v${pkgver}.tar.gz)
sha512sums=('a61b325d91a891d1d7619f127768816f9f1c1d783d3d6f8ba5e38c4f0b2703b103fd817ab9d745762e742afd7a07b7598fd1464a308099f1978ae151e83af3db')

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
